/// @description Insert description here
// You can write your code in this editor

// This oscillates the camera up and down during the menu screen.
if(room == rMenu) {
	oCamera.yPos++;
	view_set_yport(0, 10 * cos(oCamera.yPos / (10 * pi) ));
}	else {
	view_set_yport(0, 0);	
}