import random as r
import math

# This file contains a script to generate a simulation data set for the PRM algorithm.
# A random emmitter location is generated at a point roughly on the surface of earth.
# 4 sattelites are generated at satellite orbit altitudes in the same catesian octanct
# as the emmitter, making them detectable by the emmitter in a real GPS scenario. The 
# coordinates of all 5 bodies and the communication time between the emmitter and each 
# satellite is printed in the console.

EARTH_RADIUS = 6371000 #metres
GPS_SAT_RADIUS = 20200000 #metres
LIGHT_SPEED = 300000000 #metres per second

#get a random 3 dimensional vector 
emitter_vec = [r.uniform(-1, 1) for _ in range(3)]

#find a scale factor which multiplies emmiter_vec to give a point on earths surface 

sum = 0
for element in emitter_vec:
    sum += element * element
vec_magnitude = math.sqrt(sum)
scale_factor = EARTH_RADIUS / vec_magnitude 

#get a point on earth's surface:
emitter = [i * scale_factor for i in emitter_vec]

print("the emmitter is at: \n" + str(emitter))

#get 4 more random vectors in the first octant
satellite_vecs = [[r.random() for _ in range(3)] for _ in range(4)]

#force the satellite vecs into the same cartesian octant as the emmitter
for i in range(3):
    if emitter[i] < 0:
        for sat_vec in satellite_vecs:
            sat_vec[i] = -sat_vec[i]
           

#find scale factors which multipliy satellite_vecs to give points at orbital distance
satellites = []
for vec in satellite_vecs:
    sum = 0
    for element in vec:
        sum += element * element
    sat_magnitude = math.sqrt(sum)
    scale_factor = GPS_SAT_RADIUS / sat_magnitude 

    #add scaled vector to list of satellites
    satellites.append([i * scale_factor for i in vec])

print("the sattelites are at: ")
for sat in satellites:
    print(sat)


#calculate signal travel times
travel_times = []
for sat in satellites:
    x_dist = sat[0] - emitter[0]
    y_dist = sat[1] - emitter[1]
    z_dist = sat[2] - emitter[2]
    total_dist = math.sqrt(x_dist*x_dist + y_dist*y_dist + z_dist*z_dist)
    travel_times.append(total_dist/LIGHT_SPEED)
    
print("the travel times are: ")
for time in travel_times:
    print(time)

    
        





