/// @description Insert description here
// You can write your code in this editor
if(!global.paused) {
	show_debug_message("paused")
	
	// Pauses the game
	pause();
} else {
	// Unpauses the game
	unpause();
	show_debug_message("unpaused")
}