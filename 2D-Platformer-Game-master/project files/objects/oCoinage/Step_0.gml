// Check if player is within pickup radius
if (instance_exists(oPlayer)) {
    if (point_distance(x, y, oPlayer.x, oPlayer.y) < pickup_radius) {
        global.coinage += value;
		instance_destroy();
    }
}
