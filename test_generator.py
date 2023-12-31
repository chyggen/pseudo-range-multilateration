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

file = open("./test_gen.txt", "w")
for j in range (10):
    # get a random 3 dimensional vector 
    emitter_vec = [r.uniform(-1, 1) for _ in range(3)]

    # find a scale factor which multiplies emmiter_vec to give a point on earths surface 

    sum = 0
    for element in emitter_vec:
        sum += element * element
    vec_magnitude = math.sqrt(sum)
    scale_factor = EARTH_RADIUS / vec_magnitude 

    # get a point on earth's surface:
    emitter = [i * scale_factor for i in emitter_vec]

    #print("\nthe emmitter is at: \n" + str(emitter))

    # get 4 more random vectors in the first octant
    satellite_vecs = [[r.random() for _ in range(3)] for _ in range(4)]

    # force the satellite vecs into the same cartesian octant as the emmitter
    for i in range(3):
        if emitter[i] < 0:
            for sat_vec in satellite_vecs:
                sat_vec[i] = -sat_vec[i]
            

    # find scale factors which multipliy satellite_vecs to give points at orbital distance
    satellites = []
    for vec in satellite_vecs:
        sum = 0
        for element in vec:
            sum += element * element
        sat_magnitude = math.sqrt(sum)
        scale_factor = GPS_SAT_RADIUS / sat_magnitude 

        #add scaled vector to list of satellites
        satellites.append([i * scale_factor for i in vec])

    """
    print("\nthe sattelites are at: ")
    for sat in satellites:
        print(sat)
    """

    # calculate signal travel times
    travel_times = []
    for sat in satellites:
        x_dist = sat[0] - emitter[0]
        y_dist = sat[1] - emitter[1]
        z_dist = sat[2] - emitter[2]
        total_dist = math.sqrt(x_dist*x_dist + y_dist*y_dist + z_dist*z_dist)
        travel_times.append(total_dist/LIGHT_SPEED)
        
    """   
    print("\nthe travel times are: ")
    for time in travel_times:
        print(str(time) + "s")
    """

    # calculate scale factors
    # distance is a signed value, only have 31 bits range
    FIXED_POINT_DISTANCE_FACTOR = int(2**31 / GPS_SAT_RADIUS)

    #time is an unsigned value, full 32 bit range
    FIXED_POINT_TIME_FACTOR = int(2**16 / 0.1)

    """
    # print scale factors
    print("\nFIXED_POINT_DISTANCE_FACTOR:")
    print(FIXED_POINT_DISTANCE_FACTOR)
    print("FIXED_POINT_TIME_FACTOR:")
    print(FIXED_POINT_TIME_FACTOR)
    """

    # generate fixed point values for use in test_PRM.c
    #print("\ncopy below into test file to initialize fixed point structures with this dataset:\n")

    print_list = [0 for i in range(5)]
    # get satellites fixed point coords
    for sat, num in zip(satellites, range(4)):
        f_dist = [int(i * FIXED_POINT_DISTANCE_FACTOR) for i in sat]
        #print("\tsetCoord(&sat_coords[" + str(num) + "], " + str(f_dist[0]) + ", " + str(f_dist[1]) + ", " + str(f_dist[2]) + ");")
        print_list[num] = f_dist
    # get emitter fixed point coords 
    em_f_dist = [int(i * FIXED_POINT_DISTANCE_FACTOR) for i in emitter]
    #print("\tsetCoord(&emitter_true_coords, " + str(em_f_dist[0]) + ", " + str(em_f_dist[1]) + ", " + str(em_f_dist[2]) + ");\n")
    print_list[4] = em_f_dist
    # get full sattelite structure in fixed point values, including distance
    for time, num in zip(travel_times, range(4)):
        f_time = int(time * FIXED_POINT_TIME_FACTOR)
        #print("\tgetGPSData(&sats[" + str(num) + "], sat_coords[" + str(num) + "], " + str(f_time) + ");")
        print_list[num].append(f_time)
    #print("\n")


    # write to test_gen.txt in readable format for X simulations where the id 1-4 are recievers and id 5 is the emitter
        
    file.write("1 {} {} {} {}\n".format(print_list[0][0], print_list[0][1], print_list[0][2], print_list[0][3]))
    file.write("2 {} {} {} {}\n".format(print_list[1][0], print_list[1][1], print_list[1][2], print_list[1][3]))
    file.write("3 {} {} {} {}\n".format(print_list[2][0], print_list[2][1], print_list[2][2], print_list[2][3]))
    file.write("4 {} {} {} {}\n".format(print_list[3][0], print_list[3][1], print_list[3][2], print_list[3][3]))
    file.write("5 {} {} {} 0\n\n".format(print_list[4][0], print_list[4][1], print_list[4][2]))

file.close()




