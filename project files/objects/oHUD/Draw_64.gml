if(!global.paused) {
	// Sets draw origin to top left corner
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	// Changes the font to the one for the statbars
	draw_set_font(fStatbars);

	// Helper variables
	var barOffset = 25;

	// Sets the statbar colors to black
	draw_set_color(c_black)

	// Draws the health bar
	draw_healthbar(left_corner_x, left_corner_y, 175, barOffset, oPlayer.health, c_black, c_gray, c_red, 0, true, true);
	draw_text(left_corner_x, (healthbar_text_height - left_corner_y), string(oPlayer.health)); // This displays the health as an integer

	// Draws the mana bar
	draw_healthbar(left_corner_x, (left_corner_y + barOffset), 175, 2 * barOffset, oPlayer.mana, c_black, c_gray, c_blue, 0, true, true);
	draw_text(left_corner_x, ((barOffset + healthbar_text_height) - left_corner_y), string(oPlayer.mana));

	// Draws the stamina bar
	draw_healthbar(left_corner_x, (left_corner_y + 2 * barOffset), 175, 3 * barOffset, oPlayer.stamina, c_black, c_gray, c_green, 0, true, true);
	draw_text(left_corner_x, ((2* barOffset + healthbar_text_height) - left_corner_y), string(round(oPlayer.stamina)));

	if(!global.paused) {
		if(oPlayer.stamina < 100 and !keyboard_check(vk_shift)) {
			oPlayer.stamina += 0.1 + oPlayer.stamina_regen_rate;
			oPlayer.stamina_regen_rate += 0.001;
		} else if(oPlayer.stamina > 100) {
			oPlayer.stamina = 100;
			oPlayer.stamina_regen_rate = 0.05;
		} else if(oPlayer.stamina < 0) {
			oPlayer.stamina = 0;
		}
	}
}