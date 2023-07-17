#include <stdint.h>

typedef struct coord{
	int32_t x;
	int32_t y;
	int32_t z;
}coord_t;
	
typedef struct GPS_data{
	coord_t coord;
	uint32_t time;
}GPS_data_t;

void gaussJordanElimination(int32_t matrix[3][4]);

void PRM(coord_t* emitter_coords, GPS_data_t A, GPS_data_t B, GPS_data_t C, GPS_data_t D);
