#include "PRM.h"
#include "stdio.h"

void gaussJordanElimination(int32_t matrix[3][4]) {
    int i, j, k;
    float temp;

    for (i = 0; i < 3; i++) {
        if (matrix[i][i] == 0.0) {
            printf("Pivot element is zero. Cannot perform Gauss-Jordan elimination.\n");
            return;
        }

        for (j = 0; j < 3; j++) {
            if (j != i) {
                temp = matrix[j][i] / matrix[i][i];

                for (k = 0; k < 4; k++) {
                    matrix[j][k] -= matrix[i][k] * temp;
                }
            }
        }
    }

    /*for (i = 0; i < 3; i++) {
        temp = matrix[i][i];
        for (j = 0; j < 4; j++) {
            matrix[i][j] /= temp;
        }
    }*/
}


void PRM(coord_t emitter_coords, GPS_data_t A, GPS_data_t B, GPS_data_t C, GPS_data_t D){
    
    //do stuff
    emitter_coords.x = 0;
    emitter_coords.y = 0;
    emitter_coords.z = 0;
    
    return emitter_coords;
}

