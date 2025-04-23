/// @description Declares various variables used in setting up the menu screen.

#macro SAVEFILE "save.ini"
#macro CHECKFILE "checkpoint.ini"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin
menu_speed = 25; // lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1; // Used in selection indexing
menu_control = true; 

menu = ["Quit", "Continue", "New Game"];

menu_items = array_length(menu)
menu_cursor = 2;

audio_play_sound(soundMenuTrack, 1, true);
