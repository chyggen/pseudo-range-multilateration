#include "PRM.h"
#include "stdio.h"
#include <time.h>

#define LIGHT_SPEED                 300000000
#define FIXED_POINT_DISTANCE_FACTOR 106
#define FIXED_POINT_TIME_FACTOR     655360
#define EARTH_RADIUS                6371000 
#define PRM_NUM_TIMESTAMPS          64
#define TERM1_CONST                 (int64_t)11106022

double sqrt(double num) {
    if (num < 0) {
        // Square root of a negative number is undefined
        return -1.0;
    }

    // Initial guess
    double x = num;

    // Newton-Raphson method to approximate the square root
    const int iterations = 10; // You can adjust the number of iterations for better accuracy
    int i;
    for (i = 0; i < iterations; i++) {
        x = 0.5 * (x + num / x);
    }

    return x;
}

void gaussianElimination(int32_t matrix[3][3], int64_t augments[], struct timespec* timestamps) {

    int i, j, k;

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (i != j) {
                
                int64_t ratio = ((int64_t)matrix[j][i] << 32) / matrix[i][i];
                for (k = 0; k < 3; k++) {
                    matrix[j][k] -= ((ratio >> 16) * matrix[i][k]) >> 16;
                }
                augments[j] -= ((ratio >> 16) * augments[i])>> 16;
            }
        }
    }
}


void PRM(coord_t* emitter_coords, GPS_data_t* sats, struct timespec* timestamps){

    /*  Goal: want to apply scale factors to Ai, Bi, Ci, Di constants to not lose precision througout.

        By facotring out 2/c from Ai, were left with (xi/ti) - (x1,t1). If we divide the t terms by 
        2^16, we should be left with a fair amount of precision. with this approach, we have essentially
        multiplied A,B,C by LIGHT_SPEED * FIXED_POINT_DISTANCE_FACTOR/2 
    */

    // Counter to track timestamps
    int timestamp_count = 0;

    #ifdef PRM_BENCHMARKING
        // timestamp index 0
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count) == 0;
        timestamp_count++;
    #endif

    // STAGE 1: matrix construction 
    
    int32_t M[3][3];
    int64_t augments[3];
        
    // optimization attempt: unroll loop to fill M matrix and augments vector
 
       
        // save reused terms so they dont have to be calculated more than once
        int32_t A_sat0_term = sats[0].coord.x / (sats[0].time);
        int32_t B_sat0_term = sats[0].coord.y / (sats[0].time);
        int32_t C_sat0_term = sats[0].coord.z / (sats[0].time);
        int64_t D_sat0_term2 = ((((int64_t)sats[0].coord.x * sats[0].coord.x) >> 2) +
                                (((int64_t)sats[0].coord.y * sats[0].coord.y) >> 2) +
                                (((int64_t)sats[0].coord.z * sats[0].coord.z) >> 2)) 
                                / ((int64_t)(sats[0].time) << 1);

        // calculation of Ai, Bi, Ci constants involves division by a non constant, so we are 
        // not trying operator strength reduction
        M[0][0] = sats[1].coord.x / (sats[1].time) - A_sat0_term;
        M[1][0] = sats[2].coord.x / (sats[2].time) - A_sat0_term;
        M[2][0] = sats[3].coord.x / (sats[3].time) - A_sat0_term;

        M[0][1] = sats[1].coord.y / (sats[1].time) - B_sat0_term;
        M[1][1] = sats[2].coord.y / (sats[2].time) - B_sat0_term;
        M[2][1] = sats[3].coord.y / (sats[3].time) - B_sat0_term;
            
        M[0][2] = sats[1].coord.z / (sats[1].time) - C_sat0_term;
        M[1][2] = sats[2].coord.z / (sats[2].time) - C_sat0_term;
        M[2][2] = sats[3].coord.z / (sats[3].time) - C_sat0_term;

        // optimization attempt: apply operator strength reduction by using shifts
        int64_t denom_1 = (int64_t)(sats[1].time) << 1;
        int64_t denom_2 = (int64_t)(sats[2].time) << 1;
        int64_t denom_3 = (int64_t)(sats[3].time) << 1;

        // optimization attempt: use pre-calculated term 1 coeficient (TERM1_CONST)
        int64_t D0_term1 = TERM1_CONST * ((int64_t)sats[1].time - sats[0].time);
        int64_t D1_term1 = TERM1_CONST * ((int64_t)sats[2].time - sats[0].time);
        int64_t D2_term1 = TERM1_CONST * ((int64_t)sats[3].time - sats[0].time);

        // optimization attempt: remove 4 divisions in term 2 calculation by grouping x,y,z in single numerator.
        // This will cut the precision of the numerator in 4 since we need to right shift 
        // coordinates so that overflow doesnt occur, but this shouldnt be noticeable. Additionally, 
        // we remove the division by FIXED_POINT_DISTANCE_FACTOR and apply operator strength 
        // reduction by replacing it with a multiplication and right shift
        int64_t D0_term2 =
                D_sat0_term2 - ((
                (((int64_t)sats[1].coord.x * sats[1].coord.x) >> 2) +
                (((int64_t)sats[1].coord.y * sats[1].coord.y) >> 2) +
                (((int64_t)sats[1].coord.z * sats[1].coord.z) >> 2))
                / denom_1 );

        int64_t D1_term2 =
                D_sat0_term2 - ((
                (((int64_t)sats[2].coord.x * sats[2].coord.x) >> 2) +
                (((int64_t)sats[2].coord.y * sats[2].coord.y) >> 2) +
                (((int64_t)sats[2].coord.z * sats[2].coord.z) >> 2))
                / denom_2 );

        int64_t D2_term2 =
                D_sat0_term2 - ((
                (((int64_t)sats[3].coord.x * sats[3].coord.x) >> 2) +
                (((int64_t)sats[3].coord.y * sats[3].coord.y) >> 2) +
                (((int64_t)sats[3].coord.z * sats[3].coord.z) >> 2))
                / denom_3 );

        // compensate for shifting and removing division by FIXED_POINT_DISTANCE_FACTOR:
        // we left shifted all the numerators in term 2 by 2 and removed a division by 106.
        // essentially, we need to divide by 106/4 = 26.5. The numerators in the previous 
        // step contain numbers that could fill the entire 64 bit range, and the denominators 
        // contain numbers which should be at the very least 31,348 (15 bits). Therefore, we
        // can safely multiply by a 14 bit number without causing overflow. our best option is 
        // to multiply by 9892 (14 bits) then right shift by 18

        D0_term2 = (D0_term2 * 9892) >> 18;
        D1_term2 = (D1_term2 * 9892) >> 18;
        D2_term2 = (D2_term2 * 9892) >> 18;

        augments[0] = D0_term1 + D0_term2;
        augments[1] = D1_term1 + D1_term2;
        augments[2] = D2_term1 + D2_term2;    

    // printf("pre gaussian:\n");
    // int i,j;

    // for (i = 0; i < 3; ++i)
    // {
    //     for(j = 0; j < 3; j++)
    //     {
    //         printf("%10d ", M[i][j]);
    //     }
    //     printf("%20ld\n", augments[i]);
    // }

    #ifdef PRM_BENCHMARKING
        // timestamp index 1
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif

    gaussianElimination(M, augments, timestamps);

    #ifdef PRM_BENCHMARKING
        // timestamp index 2
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif

    /*printf("post gaussian:\n");
    for (i = 0; i < 3; ++i)
    {
        for(j = 0; j < 3; j++)
        {
            printf("%10d ", M[i][j]);
        }
        printf("%20ld\n", augments[i]);
    }*/

    emitter_coords->x = -(int32_t)(augments[0] / M[0][0]); 
    emitter_coords->y = -(int32_t)(augments[1] / M[1][1]);
    emitter_coords->z = -(int32_t)(augments[2] / M[2][2]);

    #ifdef PRM_BENCHMARKING
        // timestamp index 3
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif

    // Scale the emmitter coords to a point on the surface of the earth
    int64_t multiplier = sqrt( 
        (int64_t)EARTH_RADIUS * EARTH_RADIUS * 106 * 106 /
        ((int64_t)emitter_coords->x * emitter_coords->x +
        (int64_t)emitter_coords->y * emitter_coords->y +
        (int64_t)emitter_coords->z * emitter_coords->z)
    );

    emitter_coords->x = (int32_t)(emitter_coords->x * multiplier);
    emitter_coords->y = (int32_t)(emitter_coords->y * multiplier);
    emitter_coords->z = (int32_t)(emitter_coords->z * multiplier);


    #ifdef PRM_BENCHMARKING
        // timestamp index 4
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif
}

