// Move in the current direction
x += lengthdir_x(move_speed, direction);
y += lengthdir_y(move_speed, direction);

// Change direction periodically
change_direction_timer--;
if (change_direction_timer <= 0) {
    direction = irandom(360); // Pick a new random direction
    change_direction_timer = irandom_range(30, 90); // Reset timer (random interval)
}

// Keep oBoss2 within the screen boundaries
if (x < 0 || x > room_width) {
    direction = 180 - direction; // Reflect horizontally
    x = clamp(x, 0, room_width); // Clamp position to screen
}

if (y < 0 || y > room_height) {
    direction = -direction; // Reflect vertically
    y = clamp(y, 0, room_height); // Clamp position to screen
}

// Ensure direction stays within 0-360 degrees
if (direction < 0) direction += 360;
if (direction >= 360) direction -= 360;

// Shooting logic
shoot_timer--;
if (shoot_timer <= 0) {
    // Fire multiple projectiles in a spread
    for (var i = 0; i < number_of_projectiles; i++) {
        var angle_offset = -spread_angle / 2 + (spread_angle / (number_of_projectiles - 1)) * i;
        var proj = instance_create_layer(x, y, "Instances", obj_boss_projectile);
        proj.direction = point_direction(x, y, oPlayer.x, oPlayer.y) + angle_offset; // Slight spread
        proj.speed = 2; // Slow projectiles
    }
    shoot_timer = 90; // Reset shoot timer (1.5 seconds if 60 FPS)
}
// Check if health is depleted
if (b2health <= 0) {
    instance_destroy(); // Destroy boss instance
    show_debug_message("Boss defeated!");
}
