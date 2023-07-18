#include "PRM.h"
#include "stdio.h"
#include "math.h"

#define SCALE_FACTOR_COORDS 1 //350381710 / (pow(2,32) * pow(10,3))
#define SCALE_FACTOR_TIME 1 //2407913067 / (pow(2,32) * pow(10,3))

void gaussJordanElimination(int32_t matrix[3][4], clock_t* timestamps) {
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


void PRM(coord_t* emitter_coords, GPS_data_t A, GPS_data_t B, GPS_data_t C, GPS_data_t D, clock_t* timestamps){
    
    //do stuff
    int32_t coefficent_matrix[3][4] = {0};
    GPS_data_t satellites[4] = {A, B, C, D};
    
    for (int i = 0; i < 3; i++ ){

        coefficent_matrix[i][0] = 2 * (((satellites[i+1].coord.x/SCALE_FACTOR_COORDS)/(satellites[i+1].time/SCALE_FACTOR_TIME)) - ((satellites[0].coord.x/SCALE_FACTOR_COORDS)/(satellites[0].time/SCALE_FACTOR_TIME)));
        coefficent_matrix[i][1] = 2 * (((satellites[i+1].coord.y/SCALE_FACTOR_COORDS)/(satellites[i+1].time/SCALE_FACTOR_TIME)) - ((satellites[0].coord.y/SCALE_FACTOR_COORDS)/(satellites[0].time/SCALE_FACTOR_TIME)));
        coefficent_matrix[i][2] = 2 * (((satellites[i+1].coord.z/SCALE_FACTOR_COORDS)/(satellites[i+1].time/SCALE_FACTOR_TIME)) - ((satellites[0].coord.z/SCALE_FACTOR_COORDS)/(satellites[0].time/SCALE_FACTOR_TIME)));
        coefficent_matrix[i][3] = (satellites[i+1].time/SCALE_FACTOR_TIME) - (satellites[0].time/SCALE_FACTOR_TIME) - ((pow(satellites[i+1].coord.x/SCALE_FACTOR_COORDS, 2)
        + pow(satellites[i+1].coord.y/SCALE_FACTOR_COORDS, 2) + pow(satellites[i+1].coord.z/SCALE_FACTOR_COORDS, 2)) / (satellites[i+1].time/SCALE_FACTOR_TIME))
        + ((pow(satellites[0].coord.x/SCALE_FACTOR_COORDS, 2) + pow(satellites[0].coord.y/SCALE_FACTOR_COORDS, 2) + pow(satellites[0].coord.z/SCALE_FACTOR_COORDS, 2)) / (satellites[0].time/SCALE_FACTOR_TIME)); 
    }


    gaussJordanElimination(coefficent_matrix, timestamps);

    emitter_coords->x = coefficent_matrix[0][3];
    emitter_coords->y = coefficent_matrix[1][3];
    emitter_coords->z = coefficent_matrix[2][3];

}

