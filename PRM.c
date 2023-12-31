#include "PRM.h"
#include "stdio.h"
#include <time.h>

#define LIGHT_SPEED                 300000000
#define FIXED_POINT_DISTANCE_FACTOR 106
#define FIXED_POINT_TIME_FACTOR     655360
#define EARTH_RADIUS                6371000 
#define PRM_NUM_TIMESTAMPS          64

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

    // Counter to track  timestamps
    int timestamp_count = 0;

    #ifdef PRM_BENCHMARKING
        // timestamp index 0
        clock_gettime(CLOCK_MONOTONIC, timestamps + timestamp_count) == 0;
        timestamp_count++;
    #endif
    
    int32_t M[3][3];
    int64_t augments[3];
    
    int row;
    for (row = 0; row < 3; ++row)
    {
        int sat_idx = row + 1;

        M[row][0] = 
            sats[sat_idx].coord.x / (sats[sat_idx].time) - 
            sats[0].coord.x / (sats[0].time);

        M[row][1] = 
            sats[sat_idx].coord.y / (sats[sat_idx].time) - 
            sats[0].coord.y / (sats[0].time);
            
        M[row][2] = 
            sats[sat_idx].coord.z / (sats[sat_idx].time) - 
            sats[0].coord.z / (sats[0].time);

        int64_t denom_i = (int64_t)(sats[sat_idx].time) * 2;
        int64_t denom_1 = (int64_t)(sats[0].time) * 2;
        
        //printf("denoms: %ld %ld\n", denom_1, denom_i);

        int64_t term1 = ((int64_t) LIGHT_SPEED * LIGHT_SPEED / 
            ((int64_t) FIXED_POINT_TIME_FACTOR * FIXED_POINT_TIME_FACTOR* 2)) *
            ((int64_t)sats[sat_idx].time - sats[0].time) * FIXED_POINT_DISTANCE_FACTOR;

        int64_t term2 =
            (((int64_t)sats[0].coord.x * sats[0].coord.x) / denom_1 +
            ((int64_t)sats[0].coord.y * sats[0].coord.y) / denom_1 +
            ((int64_t)sats[0].coord.z * sats[0].coord.z) / denom_1 -
            ((int64_t)sats[sat_idx].coord.x * sats[sat_idx].coord.x) / denom_i -
            ((int64_t)sats[sat_idx].coord.y * sats[sat_idx].coord.y) / denom_i -
            ((int64_t)sats[sat_idx].coord.z * sats[sat_idx].coord.z) / denom_i) /
            FIXED_POINT_DISTANCE_FACTOR;
            

        //printf("term 1: %ld\nterm 2: %ld\n", term1, term2);

        augments[row] = term1 + term2;
    }

    /*printf("pre gaussian:\n");
    int i,j;

    for (i = 0; i < 3; ++i)
    {
        for(j = 0; j < 3; j++)
        {
            printf("%10d ", M[i][j]);
        }
        printf("%20ld\n", augments[i]);
    }*/

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

