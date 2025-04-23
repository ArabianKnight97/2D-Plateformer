/// @description Insert description here
// You can write your code in this editor

var mouseCoords = string_concat("(", string(mouse_x), ", ", string(mouse_y), ")");


show_debug_message(mouseCoords)
show_debug_message(string_concat("(", string(getActualMouseCoords(0)), ", ", string(getActualMouseCoords(1)), ")"))
