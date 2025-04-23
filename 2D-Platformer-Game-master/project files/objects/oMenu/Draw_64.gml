/// @description Draws out menu options

// Draws title screen
draw_set_font(fTitle);
draw_set_color(c_black)
draw_text(480, 135, "bean game");
draw_rectangle_color(25, 120, 480, 123, c_black,c_black,c_black,c_black, false);
draw_set_font(fMenu);

// Sets up font attributes
draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

// Draws out each of the menu options
for(var i = 0; i < menu_items; i++) {
	var txt = menu[i];
	if(menu_cursor == i) {
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	} else {
		var col = c_gray;	
	}
	
	// Stores the coordinates for the text and an offset to create the outline
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	var offset = 2;
	
	// Adds an outline to the text options
	draw_set_color(c_black);
	draw_text(xx - offset,yy,txt);
	draw_text(xx + offset,yy,txt);
	draw_text(xx,yy - offset,txt);
	draw_text(xx,yy + offset,txt);
	
	// Draws the text
	draw_set_color(col);
	draw_text(xx, yy, txt);
}