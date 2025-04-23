// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game()
{
	// overwrite old save
	if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

	// create new save
	var file = ini_open(SAVEFILE);
	ini_write_real("game", "room", asset_get_index(room_get_name(room)));
	ini_write_real("player", "x", x);
	ini_write_real("player", "y", y);
	ini_close();
	
	if (room_get_name(room) == "startArea") return;
	
	
	
	// write save indicator to screen
	instance_create_depth(
		camera_get_view_x(view_camera[0]) + 5,
		camera_get_view_y(view_camera[0]) + 245,
		-400,
		oScreenText, {text : "game saved", color : 64000, time_to_live : 100})
}

function restore_game(file) 
{
	ini_open(file)
	var _target = ini_read_real("game", "room", 0);
	ini_close();
	room_goto(_target);
}

// possible method of implementing player death, needs review
/*
function kill_player(id)
{
	show_debug_message("kill call");
	//instance_destroy(oPlayer.id);
	restore_game()
	oPlayer.health = 100;
	oPLayer.stamina = 100;
	oPLayer.mana = 100;
}*/