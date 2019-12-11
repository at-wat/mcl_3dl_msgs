std_msgs/Header header

# status definitions

uint8 NORMAL = 0
uint8 GLOBAL_LOCALIZATION = 1
uint8 EXPANSION_RESETTING = 2
uint8 COVARIANCE_CONVERGED = 3

uint8 status

# error definitions

uint8 GOING_WELL = 0
uint8 LARGE_STD_VALUE = 1
uint8 POINTS_NOT_FOUND = 2

uint8 error

uint32 particle_size
float32 match_ratio
