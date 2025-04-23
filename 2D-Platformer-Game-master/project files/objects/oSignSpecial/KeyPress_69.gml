var random_rooms=[rRandomRoom1, rRandomRoom2, rRandomRoom3]

/// @description Sends the player to a random room
if(global.adventure_count >= max_adventure) {
	global.adventure_count = 0
	room_goto(rAreaB2)
} else if(place_meeting(x, y, oPlayer) == 1 && !global.paused) {
	global.adventure_count += 1
	
	var random_room_choices = array_filter(random_rooms, function(val) {
		return val != room
		});
	
	room_goto(random_room_choices[random_range(0, array_length(random_room_choices))])
} 