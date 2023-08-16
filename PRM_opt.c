#include "PRM.h"
#include "stdio.h"
#include <time.h>
#include <math.h>

#define LIGHT_SPEED                 300000000
#define FIXED_POINT_DISTANCE_FACTOR 106
#define FIXED_POINT_TIME_FACTOR     655360
#define EARTH_RADIUS                6371000 
#define PRM_NUM_TIMESTAMPS          64
#define TERM1_CONST                 (int64_t)11106022


void putTimestamp(struct timespec* timestamps, int* timestamp_count )
{
    #ifdef PRM_BENCHMARKING
        clock_gettime(CLOCK_MONOTONIC, timestamps + *timestamp_count) == 0;
        (*timestamp_count)++;
    #endif
}

void PRM(coord_t* emitter_coords, GPS_data_t* sats, struct timespec* timestamps){

    /*  Goal: want to apply scale factors to Ai, Bi, Ci, Di constants to not lose precision througout.

        By facotring out 2/c from Ai, were left with (xi/ti) - (x1,t1). If we divide the t terms by 
        2^16, we should be left with a fair amount of precision. with this approach, we have essentially
        multiplied A,B,C by LIGHT_SPEED * FIXED_POINT_DISTANCE_FACTOR/2 
    */

    // Counter to track timestamps
    int timestamp_count = 0;

    // timestamp index 0
    putTimestamp(timestamps, &timestamp_count);

    // STAGE 1: matrix construction 
    
    int32_t M[3][3];
    int64_t augments[3];
        
    // optimization attempt: unroll loop to fill M matrix and augments vector
       
    // save reused terms so they dont have to be calculated more than once
    int32_t A_sat0_term = sats[0].coord.x / (sats[0].time);
    int32_t B_sat0_term = sats[0].coord.y / (sats[0].time);
    int32_t C_sat0_term = sats[0].coord.z / (sats[0].time);

    // timestamp index 1
    putTimestamp(timestamps, &timestamp_count);

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

    // timestamp index 2
    putTimestamp(timestamps, &timestamp_count);

    // optimization attempt: apply operator strength reduction by using shifts
    int64_t denom_1 = (int64_t)(sats[1].time) << 1;
    int64_t denom_2 = (int64_t)(sats[2].time) << 1;
    int64_t denom_3 = (int64_t)(sats[3].time) << 1;

    // optimization attempt: use pre-calculated term 1 coeficient (TERM1_CONST)
    int64_t D0_term1 = TERM1_CONST * ((int64_t)sats[1].time - sats[0].time);
    int64_t D1_term1 = TERM1_CONST * ((int64_t)sats[2].time - sats[0].time);
    int64_t D2_term1 = TERM1_CONST * ((int64_t)sats[3].time - sats[0].time);

    // timestamp index 3
    putTimestamp(timestamps, &timestamp_count);
    // THIS IS THE BOTTLENECK: need to optimise term2 calculations

    // optimization attempt: remove 4 divisions in term 2 calculation by grouping x,y,z in single numerator.
    // This will cut the precision of the numerator in 4 since we need to right shift 
    // coordinates so that overflow doesnt occur, but this shouldnt be noticeable. Additionally, 
    // we remove the division by FIXED_POINT_DISTANCE_FACTOR and apply operator strength 
    // reduction by replacing it with a multiplication and right shift
    
    int64_t D_sat0_term2 = ((((int64_t)sats[0].coord.x * sats[0].coord.x) >> 2) +
                            (((int64_t)sats[0].coord.y * sats[0].coord.y) >> 2) +
                            (((int64_t)sats[0].coord.z * sats[0].coord.z) >> 2)) 
                            / ((int64_t)(sats[0].time) << 1);

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

    // timestamp index 4
    putTimestamp(timestamps, &timestamp_count);

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

    // timestamp index 5
    putTimestamp(timestamps, &timestamp_count);

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
        // timestamp index 6
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif

    // STAGE 2: gaussian elimination 

    // optimization attempt: fully unroll gaussian elim loops
    int64_t ratio;

    // use row 0 to eliminate first element of row 1
    ratio = ((int64_t)M[1][0] << 16) / M[0][0];
    M[1][0] = 0; // no reason to calculate since will be ignored if non-zero
    M[1][1] -= (ratio * M[0][1]) >> 16;
    M[1][2] -= (ratio * M[0][2]) >> 16;
    augments[1]  -= (ratio * augments[0])  >> 16;

    // use row 0 to eliminate first element of row 2
    ratio = ((int64_t)M[2][0] << 16) / M[0][0];
    M[2][0] = 0; // no reason to calculate since will be ignored if non-zero
    M[2][1] -= (ratio * M[0][1]) >> 16;
    M[2][2] -= (ratio * M[0][2]) >> 16;
    augments[2]  -= (ratio * augments[0])  >> 16;

    // use row 1 to eliminate second element of row 0
    ratio = ((int64_t)M[0][1] << 16) / M[1][1];
 // M[0][0] will not be changed by row reduction because M[1][0] has been set to 0
    M[0][1] = 0; // no reason to calculate since will be ignored if non-zero
    M[0][2] -= (ratio * M[1][2]) >> 16;
    augments[0]  -= (ratio * augments[1])  >> 16;

    // use row 1 to eliminate second element of row 2
    ratio = ((int64_t)M[2][1] << 16) / M[1][1];
 // M[0][0] will not be changed by row reduction because M[2][0] has been set to 0
    M[0][1] = 0; // no reason to calculate since will be ignored if non-zero
    M[2][2] -= (ratio * M[1][2]) >> 16;
    augments[2]  -= (ratio * augments[1])  >> 16;
    
    // for the last two steps, there is no reason to do anything but modify the augments.
    // this will leave the M with non zero elemnts at [0][2] and [1][2], or in the form:
    // a 0 c 
    // 0 e f
    // 0 0 i
    // but this is ok since these elements will not be used for further row reductions,
    // we only care about the elements [0][0], [1][1] and [2][2] as well as the augments.

    // use row 2 to modify augments
    ratio = ((int64_t)M[0][2] << 16) / M[2][2];
    augments[0]  -= (ratio * augments[2])  >> 16;

    ratio = ((int64_t)M[1][2] << 16) / M[2][2];
    augments[1]  -= (ratio * augments[2])  >> 16;

    #ifdef PRM_BENCHMARKING
        // timestamp index 7
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
        // timestamp index 8
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif

    // Scale the emmitter coords to a point on the surface of the earth
    double multiplier = EARTH_RADIUS * 106 / sqrt( 
        ((int64_t)emitter_coords->x * emitter_coords->x +
        (int64_t)emitter_coords->y * emitter_coords->y +
        (int64_t)emitter_coords->z * emitter_coords->z)
    );

    emitter_coords->x = (int32_t)(emitter_coords->x * multiplier);
    emitter_coords->y = (int32_t)(emitter_coords->y * multiplier);
    emitter_coords->z = (int32_t)(emitter_coords->z * multiplier);


    #ifdef PRM_BENCHMARKING
        // timestamp index 9
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count);
        timestamp_count++;
    #endif
}

