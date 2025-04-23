if(place_meeting(oSignpost.x, oSignpost.y, oPlayer) == 1 && !global.paused) {
	if(room = startArea) {
		oSignpost.image_index = 2
		oE_Key.visible = true
		
	}
	else if(room = rAreaB2) {
		if(oPlayer.x > 600) {
			oSignpost.image_index = 2 // This is the main signpost from start area
			oE_Key.x = 1496
			oE_Key.visible = true
		} else {
			 // Sign points to the left
			oE_Key.visible = true;
			oE_Key.x = 96
		}
	}
} else if(room = rAreaB2 && oPlayer.x < 1000 && oPlayer.x > 900) {
	// This moves the sign to the other location when the main sign is offscreen
	oSignpost.x = 96 
	oSignpost.image_index = 1
}
else {
	oE_Key.visible = false;
}	