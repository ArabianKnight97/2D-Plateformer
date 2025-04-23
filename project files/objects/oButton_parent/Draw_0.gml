/// @description Actions for drawing the button.

// Draws the button
draw_self();

// Sets the font
draw_set_font(fButtons);

// Sets the origin to the center and the middle
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draws the text
draw_text_color(x,y,button_text, c_white,c_white,c_white,c_white,255);

// Resets the origin back to the default so it doesn't mess with anything else.s
draw_set_halign(fa_left);
draw_set_valign(fa_top);