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

void setCoord(coord_t satellite, int32_t X, int32_t Y, int32_t Z){
    satellite.x = X;
    satellite.y = Y;
    satellite.z = Z;
}

void getGPSData(GPS_data_t satellite, coord_t coords, uint32_t distance){
    satellite.coord = coords;
    satellite.time = distance; 
}


void PRM(coord_t emitter_coords, GPS_data_t A, GPS_data_t B, GPS_data_t C, GPS_data_t D){
    
    //do stuff
    emitter_coords.x = 0;
    emitter_coords.y = 0;
    emitter_coords.z = 0;
    
    return emitter_coords;
}

int main(){

    
    coord_t a_coords, b_coords, c_coords, d_coords, emitter_coords;
    GPS_data_t a_satellite, b_satellite, c_satellite, d_satellite;



/* create GPS data using assuming a general default altitude of 20,200km found through online search
This scenario is assuming a situation with 4 satellites (A,B,C,D) which have pre set coordinates and 
distances set at A - long: 40.12345 lat:-75.67890 dis: 5km, B - lat: 35.98765 long: -80.24680 dis: 4.5km, 
C - lat: 38.24680 long: -72.13579 dis: 4.8km, D - lat: 42.86420 long: -80.12345 dis:5.2km generated
via chatGPT*/

//after converting to cartesian via an online calculator
    setCoord(a_coords, -5062764.806, 7198517.764, 20200);
    setCoord(b_coords, -5949130.852, 7344674.820, 20200);
    setCoord(c_coords, -5042821.622, 6679893.159, 20200);
    setCoord(d_coords, -4955695.349, 7859218.062, 20200);

    getGPSData(a_satellite, a_coords, 5);
    getGPSData(b_satellite, b_coords, 4.5);
    getGPSData(c_satellite, c_coords, 4.8);
    getGPSData(d_satellite, d_coords, 5.2);

    
    PRM(emitter_coords, a_satellite, b_satellite, c_satellite, d_satellite);

    return 0;
}