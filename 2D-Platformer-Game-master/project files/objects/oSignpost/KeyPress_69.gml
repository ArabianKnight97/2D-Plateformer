/// @description Insert description here
// You can write your code in this editor
if(place_meeting(oSignpost.x, oSignpost.y, oPlayer) == 1 && !global.paused) {
	// Go from start area to B2
	if(room = startArea) {room_goto(rAreaB2);}
	
	else if(room = rAreaB2) {
		if(oPlayer.x > 600) {room_goto(startArea)}
		else{room_goto(rAreaB3)}
	}
		
} 