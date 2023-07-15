#include <stdint.h>

typedef struct coord_t{
	int32_t x;
	int32_t y;
	int32_t z;
};
	
typedef struct GPS_data_t{
	coord_t coord;
	uint32_t time;
};

void gaussJordanElimination(int32_t matrix[3][4]);

coord_t PRM(GPS_data_t A, GPS_data_t B, GPS_data_t C, GPS_data_t D);
