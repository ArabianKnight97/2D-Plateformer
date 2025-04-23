function controlsSetup()
{
	bufferTime = 3; //frames for buffer
	
	jumperKeyBuffered = 0;
	JumpKeyBufferTimer = 0;
}


function getControls ()
{
	//Directional inputs
	rightKey = keyboard_check (ord("D")) + gamepad_button_check( 0, gp_padr );
		rightKey = clamp ( rightKey, 0, 1)
	
	leftKey = keyboard_check (ord("A")) + gamepad_button_check( 0, gp_padl );
		leftKey = clamp ( leftKey, 0, 1)
		
	downKey = keyboard_check (ord("S")) + gamepad_button_check( 0, gp_padd );
		downKey = clamp ( downKey, 0, 1)
	
	
	//Action inputs
	jumpKeyPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed( 0, gp_face1);
		jumpKeyPressed = clamp (jumpKeyPressed, 0, 1);
		
	jumpKey = keyboard_check(vk_space) + gamepad_button_check( 0, gp_face1);
		jumpKey = clamp ( jumpKey, 0, 1);
		
		runKey = keyboard_check(vk_shift) + gamepad_button_check( 0, gp_face3);
		runKey = clamp (runKey, 0, 1);
		
	//Jumpe key buffering
	if jumpKeyPressed
	{
		JumpKeyBufferTimer = bufferTime;
	}
	if JumpKeyBufferTimer > 0
	{
		JumpKeyBuffered = 1;
		JumpKeyBufferTimer--;
	} else {
		JumpKeyBuffered = 0;
	}
}

/**
* Returns the mouse coordinates in terms normalized to the camera's view instead of the room's coordinates
* @param coord - If 0, returns x-coordinate. If 1, returns the y-coordinate. 
*
*/
function getActualMouseCoords(coord) {
	var returnCoordinate = 0;
	
	if(coord == 0) {
		returnCoordinate = mouse_x - camera_get_view_x(view_camera[0])	
	} else if (coord == 1) {
		returnCoordinate = mouse_y - camera_get_view_y(view_camera[0])
	} else {
		show_debug_message("Invalid coordinate input type")
	}
	
	if(returnCoordinate < 0) {
		returnCoordinate = -1
		show_debug_message("Coordinate is not on screen")
	}
	
	return returnCoordinate;
}
	
/**
* Returns the mouse coordinates in terms normalized to the camera's view instead of the room's coordinates
* @param coordType - If 0, returns x-coordinate. If 1, returns the y-coordinate. 
* @param coordinate: The value of the coordinate.
*
*/
function getScreenCoords(coordType, coordinate) {
	var returnCoordinate = 0;
	
	if(coord == 0) {
		returnCoordinate = coordinate - camera_get_view_x(view_camera[0])	
	} else if (coord == 1) {
		returnCoordinate = coordinate - camera_get_view_y(view_camera[0])
	} else {
		show_debug_message("Invalid coordinate input type")
	}
	
	if(returnCoordinate < 0) {
		returnCoordinate = -1
		show_debug_message("Coordinate is not on screen")
	}
	
	return returnCoordinate;
}
