/// @description Allows the user to drag the slider

// Only moves the slider when the mouse is pressed while touching the slider and slider box
if(position_meeting(mouse_x, mouse_y, self) && position_meeting(mouse_x, mouse_y, oSlider_parent)) {

	// Sets the x position of the slider to the mouse
	x = mouse_x;
	
	// Sets the slider cursor in bounds if it ever goes outside of it
	if(x < xstart - margin) {
		x = xstart - margin;
	} else if(x > xstart + margin) {
		x = xstart + margin;
	} 

}
