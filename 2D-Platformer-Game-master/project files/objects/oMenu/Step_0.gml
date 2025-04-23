/// @description Control Menu
// You can write your code in this editor

// Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

// Keyboard controls
if(menu_control) {
	if(keyboard_check_pressed(vk_up)) {
		audio_play_sound(select_sound, 1, false, 1);
		menu_cursor++;	
		if(menu_cursor >= menu_items) {
			menu_cursor = 0;	
		}
	}
	if(keyboard_check_pressed(vk_down)) {
		audio_play_sound(select_sound, 1, false, 1);
		menu_cursor--;	
		if(menu_cursor < 0) {
			menu_cursor = menu_items - 1;	
		}
	}
	
	if(keyboard_check_pressed(vk_enter)) {
		audio_stop_all();
		menu_x_target= gui_width + 200;	
		menu_committed = menu_cursor;
		
		// Add screenshake effect
		menu_control = false;
	}
}

if((menu_x > gui_width + 150) && (menu_committed != -1)) {
	switch (menu_committed) {
		case 2: default: {
			if (file_exists(SAVEFILE)) file_delete(SAVEFILE)
			if (file_exists(CHECKFILE)) file_delete(CHECKFILE)
			room_goto_next();  break;
		}
		case 1: {
			if(!file_exists(SAVEFILE)) room_goto_next();
			else restore_game(SAVEFILE);
		} 
		break;
		case 0: game_end(); break;
	
		
	}
}