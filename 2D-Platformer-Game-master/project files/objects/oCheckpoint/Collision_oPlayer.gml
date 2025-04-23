// @description Saves the game.

//check for first contact
if (oCheckpoint.sprite_index == sCheckpointFalse)
{
	// overwrite old file
	if(file_exists(CHECKFILE)) file_delete(CHECKFILE);
	
	// save checkpoint data
	ini_open(CHECKFILE);
	
	ini_write_real("checkpoint", "room", asset_get_index((room_get_name(room))));
	ini_write_real("player", "x", oCheckpoint.x);
	ini_write_real("player", "y", oCheckpoint.y);
	
	ini_close();
	
	oCheckpoint.sprite_index = sCheckpointTrue;
	
	// write save indicator to screen
	instance_create_depth(
		camera_get_view_x(view_camera[0]) + 5,
		camera_get_view_y(view_camera[0]) + 245,
		-400,
		oScreenText, {text : "game saved", color : c_lime, time_to_live : 100})
}
