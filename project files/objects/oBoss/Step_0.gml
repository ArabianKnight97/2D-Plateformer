

// Movement logic (up and down)
y += move_speed * move_direction;

// Reverse direction at bounds
if (y > start_y + move_range || y < start_y) {
    move_direction *= -1; // Change direction
}

// Avoid touching oHouseFloor
if (floor_avoidance_enabled && place_meeting(x, y, ohouseFloor)) {
    y -= avoidance_height; // Move boss higher
    move_direction = -1; // Change direction to move upward
}

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
if (b1health <= 0) {
    instance_destroy(); // Destroy boss instance
    show_debug_message("Boss defeated!");
}
