#include <stdio.h>
#include <time.h>

#include "PRM.h"


//comment this line to disable benchmarking within the PRM algorithm
#define PRM_BENCHMARKING 

#ifdef PRM_BENCHMARKING
#define PRM_NUM_TIMESTAMPS 64 //TODO: figure out how many timestamps are needed
#endif

void setCoord(coord_t* coord, int32_t X, int32_t Y, int32_t Z){
    coord->x = X;
    coord->y = Y;
    coord->z = Z;
}

void getGPSData(GPS_data_t* satellite, coord_t coords, uint32_t time){
    setCoord(&(satellite->coord), coords.x, coords.y, coords.z);
    satellite->time = time; 
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
    setCoord(&a_coords, -5062764.806, 7198517.764, 20200);
    setCoord(&b_coords, -5949130.852, 7344674.820, 20200);
    setCoord(&c_coords, -5042821.622, 6679893.159, 20200);
    setCoord(&d_coords, -4955695.349, 7859218.062, 20200);

    getGPSData(&a_satellite, a_coords, 5);
    getGPSData(&b_satellite, b_coords, 4.5);
    getGPSData(&c_satellite, c_coords, 4.8);
    getGPSData(&d_satellite, d_coords, 5.2);

    #ifdef PRM_BENCHMARKING

        //initialize timestamp array for benchmarking
        clock_t timestamps[PRM_NUM_TIMESTAMPS] = {0}; 
        printf("*Benchmarking enabled*\n\n");

    #else 

        //initialize timestamp array for benchmarking
        clock_t* timestamps = NULL; 
        printf("*Benchmarking disabled*\n\n");

    #endif

    //set start time:
    clock_t start_time = clock();

    //run program
    PRM(&emitter_coords, a_satellite, b_satellite, c_satellite, d_satellite, timestamps);

    //set end time:
    clock_t end_time = clock();

    //display performance summary
    clock_t PRM_runtime = end_time - start_time;
    double PRM_runtime_ms = (double)PRM_runtime * 1000 / CLOCKS_PER_SEC;
    printf("PRM complete in %f milliseconds\n", PRM_runtime_ms);

    #ifdef PRM_BENCHMARKING

        int i;
        for (i = 0; (i < PRM_NUM_TIMESTAMPS) && (timestamps[i] != 0); i++)
        {
            clock_t timestamp_offset = timestamps[i] - start_time;
            double timestamp_offset_ms = (double)timestamp_offset * 1000 / CLOCKS_PER_SEC;
            printf("timestamp %d: %f milliseconds\n",i ,timestamp_offset_ms);
        }
    
    #endif







    return 0;
}