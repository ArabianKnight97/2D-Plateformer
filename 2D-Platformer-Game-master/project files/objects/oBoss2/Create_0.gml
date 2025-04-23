// Initialize movement variables
move_direction = 1; // 1 = down, -1 = up
move_range = 200; // Distance to travel vertically
start_y = y; // Store starting position
move_speed = 1; // Speed of vertical movement

// Shooting variables
shoot_timer = 60; // Time between volleys (in frames)
number_of_projectiles = 5; // Number of projectiles per volley
spread_angle = 30; // Spread angle for projectiles (in degrees)

// Collision avoidance
floor_avoidance_enabled = true; // Enable avoidance for oHouseFloor
avoidance_height = 50; // Distance to move higher when near the floor

// Movement variables
move_speed = 3; // Speed of movement
change_direction_timer = 60; // Timer to change direction every 60 frames
direction = irandom(360); // Initial random direction




b2health = 100; // Set boss health
isEnemy = true;