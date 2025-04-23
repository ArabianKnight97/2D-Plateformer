/// @description Depletes stamina when SHIFT is pressed
// You can write your code in this editor

if(oPlayer.stamina > 0.1 && !global.paused) {
	oPlayer.stamina -= 1;
} 