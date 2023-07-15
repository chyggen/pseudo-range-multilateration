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

    for (i = 0; i < 3; i++) {
        temp = matrix[i][i];
        for (j = 0; j < 4; j++) {
            matrix[i][j] /= temp;
        }
    }
}