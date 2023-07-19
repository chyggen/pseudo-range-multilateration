#include <stdint.h>
#include <time.h>

typedef struct coord{
	int32_t x;
	int32_t y;
	int32_t z;
}coord_t;
	
typedef struct GPS_data{
	coord_t coord;
	uint32_t time;
}GPS_data_t;

void gaussianElimination(int32_t matrix[3][3], int64_t augments[], clock_t* timestamps);

void PRM(coord_t* emitter_coords, GPS_data_t* sats, clock_t* timestamps);
