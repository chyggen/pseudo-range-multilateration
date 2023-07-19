#include "PRM.h"
#include "stdio.h"

#define LIGHT_SPEED 300000000

void gaussianElimination(int32_t matrix[3][3], int64_t augments[], clock_t* timestamps) {

    int i, j, k;
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            if (i != j) {
                int32_t ratio = matrix[j][i] / matrix[i][i];
                for (k = 0; k < 3; k++) {
                    matrix[j][k] -= ratio * matrix[i][k];
                }
                augments[j] -= ratio * augments[i];
            }
        }
    }
}


void PRM(coord_t* emitter_coords, GPS_data_t* sats, clock_t* timestamps){

    /*  Goal: want to apply scale factors to Ai, Bi, Ci, Di constants to not lose precision througout.

        By facotring out 2/c from Ai, were left with (xi/ti) - (x1,t1). If we divide
        the t terms by 2^16, we should be left with a fair amount of precision 
    */

   int32_t M[3][3];
   int64_t augments[3];
    
    int row;
    for (row = 0; row < 3; ++row)
    {
        int sat_idx = row + 1;

        M[row][0] = 
            sats[sat_idx].coord.x / (sats[sat_idx].time >> 16) - 
            sats[0].coord.x / (sats[0].time >> 16);

        M[row][1] = 
            sats[sat_idx].coord.y / (sats[sat_idx].time >> 16) - 
            sats[0].coord.y / (sats[0].time >> 16);
            
        M[row][2] = 
            sats[sat_idx].coord.z / (sats[sat_idx].time >> 16) - 
            sats[0].coord.z / (sats[0].time >> 16);

        int64_t denom_i = (int64_t)(sats[sat_idx].time >> 16) * LIGHT_SPEED;
        int64_t denom_1 =  (int64_t)(sats[0].time >> 16) * LIGHT_SPEED;
        
        augments[row] = denom_i - denom_1 -
            ((int64_t)sats[sat_idx].coord.x * sats[sat_idx].coord.x) / denom_i -
            ((int64_t)sats[sat_idx].coord.y * sats[sat_idx].coord.y) / denom_i -
            ((int64_t)sats[sat_idx].coord.z * sats[sat_idx].coord.z) / denom_i +
            ((int64_t)sats[0].coord.x * sats[0].coord.x) / denom_1 +
            ((int64_t)sats[0].coord.y * sats[0].coord.y) / denom_1 +
            ((int64_t)sats[0].coord.z * sats[0].coord.z) / denom_1;
    }

    printf("pre gaussian:\n");
    int i,j;

    for (i = 0; i < 3; ++i)
    {
        for(j = 0; j < 3; j++)
        {
            printf("%10d ", M[i][j]);
        }
        printf("%20d\n", augments[i]);
    }

    gaussianElimination(M, augments, timestamps);

    printf("post gaussian:\n");
    for (i = 0; i < 3; ++i)
    {
        for(j = 0; j < 3; j++)
        {
            printf("%10d ", M[i][j]);
        }
        printf("%20d\n", augments[i]);
    }


}

