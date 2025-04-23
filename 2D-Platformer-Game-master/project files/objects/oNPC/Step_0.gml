if (!global.paused) {
    // Check if the NPC's health is 0 or less
    if (health <= 0) {
        // Play death animation (optional)
        set_state_sprite(NPCdeath, 1, 0);

        // Destroy the NPC after death animation ends (if needed)
        if (sprite_index == NPCdeath && image_index >= sprite_get_number(NPCdeath) - 1) {
            instance_destroy(); // Remove the NPC
        }
        return; // Exit the Step event logic
    }
	
	switch (state) {
	    case "chase":
	        #region chase state
	        set_state_sprite(_npcWalk, 3, 0);
        
	        // Check if oPlayer exists
	        if (!instance_exists(oPlayer)) break;
        
	        // Face the player
	        image_xscale = sign(oPlayer.x - x);
	        if (image_xscale == 0) {
	            image_xscale = 1;
	        }
        
	        // Calculate distance to the player
	        var direction_facing = image_xscale;
	        var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
        
	        // Transition to attack state if within range
	        if (distance_to_player <= attack_range) {
	            state = "attack";
	            cooldown_timer = attack_cooldown; // Start the cooldown timer
	        } else {
	            // Move towards player if out of range
	            move_and_collide(direction_facing * chase_speed, 0, oWall);
	        }
	        #endregion
	        break;
        
	    case "attack":
	        #region Attack State
	        set_state_sprite(NPCattack, 1, 0); // Switch to attack sprite

	        // Calculate the distance again to ensure it's updated
	        var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
        
	        // Check if cooldown timer is still active
	        if (cooldown_timer > 0) {
	            cooldown_timer--; // Count down the cooldown timer
	        } else {
	            // Inflict damage to the player if they are still within attack range
	            if (instance_exists(oPlayer) && distance_to_player <= attack_range) {
	                oPlayer.health -= damage_amount; // Reduce player's health by 10
	                cooldown_timer = attack_cooldown; // Reset cooldown after an attack
	            }

	            // Return to chase state if the player is out of range
	            if (distance_to_player > attack_range || !instance_exists(oPlayer)) {
	                state = "chase";
	            }
	        }
	        #endregion
	        break;
	}
}