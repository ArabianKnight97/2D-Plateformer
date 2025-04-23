if(global.inventory){
	var col_tan = make_color_rgb(210, 180, 140); // tan
	var col_medT = make_color_rgb(185, 155, 115); // medium tan
	var col_darkT = make_color_rgb(160, 130, 90); // darker tan
	var col_darkerT = make_color_rgb(150, 120, 85); // darkest tan
	var col_darkB = make_color_rgb(120, 60, 60); // dark brown
	var col_tanB = make_color_rgb(176, 131, 109); // tan-brown
	var col_green = make_color_rgb(24, 138, 22);
	var col_greenD = make_color_rgb(16, 82, 15);
	var col_greenL = make_color_rgb(95, 250, 92);
	var col_text = make_color_rgb(250, 241, 222);
	depth = -1000;
	
	draw_set_color(col_tan);
	draw_rectangle(40, 40, 919, 499, false) // main canvas
	draw_set_color(col_darkerT);
	draw_rectangle(40, 40, 919, 110, false); // filler for top tabs
	
	// border lines around main canvas
	draw_set_color(col_darkB);
	draw_line_width(39, 39, 919, 39, 8); // top
	draw_line_width(39, 39, 39, 499, 8); // left
	draw_line_width(919, 39, 919, 499, 8); // right
	draw_line_width(39, 499, 919, 499, 8); // bottom
	
	// draw line for top tabs
	draw_line_width(40, 109, 919, 109, 8);
	draw_line_width(699, 40, 699, 109, 8); // splitter
	
	// draw boxes for top tab group with fillers
	draw_set_color(col_darkB);
	draw_rectangle(55, 48, 200, 101, false); // PEASANT
	draw_rectangle(216, 48, 361, 101, false); // BRUTALIST
	draw_rectangle(377, 48, 522, 101, false); // ALCHEMIST
	draw_rectangle(538, 48, 683, 101, false); // BULLSEYE
	draw_rectangle(715, 48, 905, 101, false); // TRAITS
	
	draw_set_color(col_tanB);
	draw_rectangle(59, 52, 196, 97, false); // PEASANT
	draw_rectangle(220, 52, 357, 97, false); // BRUTALIST
	draw_rectangle(381, 52, 518, 97, false); // ALCHEMIST
	draw_rectangle(542, 52, 679, 97, false); // BULLSEYE
	draw_rectangle(719, 52, 901, 97, false); // TRAITS
	
	// text for top tabs
	draw_set_color(col_text);
	draw_set_font(fInventoryBig);
	draw_text(79, 60, "PEASANT");
	draw_text(232, 60, "BRUTALIST");
	draw_text(388, 60, "ALCHEMIST");
	draw_text(559, 60, "BULLSEYE");
	draw_text(773, 60, "TRAITS");
	
	
	// draw inner fill box for inventory section
	draw_set_color(col_medT);
	draw_rectangle(449, 124, 904, 484, false);
	draw_set_color(col_tanB); 
	draw_rectangle(449, 184, 904, 424, false); // body around slot box
	
	// draw outer box for the inventory section
	draw_set_color(col_darkB);
	draw_line_width(449, 124, 904, 124, 6); // top
	draw_line_width(449, 124, 449, 484, 6); // left
	draw_line_width(904, 124, 904, 484, 6); // right
	draw_line_width(449, 484, 904, 484, 6); // bottom
	
	// draw upper inventory tab bar splitter
	draw_line_width(449, 184, 904, 184, 6);
	
	// draw lower inventory tab bar splitter
	draw_line_width(449, 424, 904, 424, 6);
	
	// draw holder box for slots
	draw_set_color(col_tan);
	draw_rectangle(464, 199, 889, 409, false);
	draw_set_color(col_darkB);
	draw_rectangle(464, 199, 889, 409, true);
	
	// draw 4x3 grid for slots
	var start_x = 479;
	var start_y = 209;
	var slot_scale = 3.5;
	var slot_width = 68;  // Slot width (adjust based on sprite size)
    var slot_height = 68; // Slot height
    var cols = 6;         // Number of columns
    var rows = 3;         // Number of rows
	
	var itemStart_x = 506;
	var itemStart_y = 213;
	var itemSlot_scale = 1.6;
	var item_scale = 1.5;
	var itemSlot_width = 68;  // Slot width (adjust based on sprite size)
    var itemSlot_height = 68; // Slot height

    // Loop through inventory slots and draw the slot then its item, if any
	for (var row = 0; row < rows; row++) {
	    for (var col = 0; col < cols; col++) {
	        var index = row * cols + col; // Calculate inventory index
	        var slot_x = start_x + (col * slot_width);
	        var slot_y = start_y + (row * slot_height);
    
	        // Draw the slot sprite
	        draw_sprite_ext(sSlot, 0, slot_x, slot_y, slot_scale, slot_scale, 0, c_white, 1);
        
	        // If an item exists in this slot, draw it
	        
			 if (global.inventorySlots[index] != noone) {
	            var item = global.inventorySlots[index]; // Get the item data
	            var item_sprite = item.sprite; // Get the sprite for the item

	            // Calculate the position to draw the item sprite on top of the slot
	            var item_x = slot_x + 28;
	            var item_y = slot_y + 4;

	            // Draw the item sprite in the slot
	            draw_sprite_ext(item_sprite, 0, item_x, item_y, item_scale, item_scale, 0, c_white, 1);
	        }
	    }
	}

	
	// draw boxes for GEAR, ITEMS, STOCK, and LOOT with fillers and text
	draw_set_color(col_darkB);
	draw_rectangle(459, 134, 597, 174, false); // GEAR
	draw_rectangle(607, 134, 746, 174, false); // ITEMS
	draw_rectangle(756, 134, 894, 174, false); // STOCK
	draw_rectangle(459, 434, 597, 474, false); // LOOT
	
	draw_set_color(col_darkT);
	draw_rectangle(463, 138, 593, 170, false); // GEAR
	draw_rectangle(611, 138, 742, 170, false); // ITEMS
	draw_rectangle(760, 138, 890, 170, false); // STOCK
	draw_rectangle(463, 438, 593, 470, false); // LOOT
	
	draw_set_font(fInventoryBig);
	draw_set_color(col_text);
	draw_text(496, 140, "GEAR");
	draw_text(647, 140, "ITEMS");
	draw_text(790, 140, "STOCK");
	draw_text(496, 440, "LOOT");
	
	// draw coinage text with variable value next to it
	draw_set_font(fInventoryCoinage);
	draw_set_color(c_yellow);
	draw_text(607, 442, "COINAGE:");
	draw_set_color(c_dkgray);
	draw_text(747, 442, + format_number_with_commas(global.coinage));
	
	// draw window with ellipse and then player sprite on top, color changes with health
	var col_main;
	var col_light;
	var col_dark;

	if (oPlayer.health <= 33) {
	    col_dark = make_color_rgb(133, 9, 9); // Dark Red
	    col_light = make_color_rgb(255, 54, 54); // Light Red
	    col_main = make_color_rgb(235, 16, 16); // Red
	} else if (oPlayer.health <= 66) {
	    col_dark = make_color_rgb(161, 79, 19); // Dark Orange
	    col_light = make_color_rgb(247, 138, 59); // Light Orange
	    col_main = make_color_rgb(227, 109, 25); // Orange
	} else {
	    col_dark = col_greenD;
	    col_light = col_greenL;
	    col_main = col_green;
	}

	draw_set_color(col_dark);
	draw_rectangle(164, 144, 325, 414, false); // outer

	draw_set_color(col_main);
	draw_rectangle(174, 154, 315, 404, false); // inner

	draw_set_color(col_light);
	draw_ellipse_color(164, 144, 325, 414, col_light, col_dark, false);

	draw_sprite_ext(sPlayerIdle, 0, 245, 394, 3.7, 3.7, 0, c_white, 1);

	
	// draw gear slots on left side of sprite window
	var scale_gear = 3.5;
	var start_gearR = 94;
	draw_sprite_ext(sHeadPiece, 0, start_gearR, 144, scale_gear, scale_gear, 0, c_white, 1);
	draw_sprite_ext(sChestplate, 0, start_gearR, 216, scale_gear, scale_gear, 0, c_white, 1);
	draw_sprite_ext(sGrieves, 0, start_gearR, 287, scale_gear, scale_gear, 0, c_white, 1);
	draw_sprite_ext(sSabaton, 0, start_gearR, 359, scale_gear, scale_gear, 0, c_white, 1);
	
	// draw gear slots on right side of sprite window
	draw_sprite_ext(sNeckPiece, 0, 340, 144, scale_gear, scale_gear, 0, c_white, 1);
	draw_sprite_ext(sFingerBand, 0, 340, 216, scale_gear, scale_gear, 0, c_white, 1);
	draw_sprite_ext(sBracelet, 0, 340, 287, scale_gear, scale_gear, 0, c_white, 1);
	draw_sprite_ext(sScroll, 0, 340, 359, scale_gear, scale_gear, 0, c_white, 1);
	
	// draw HP and MANA bars with number in-line
	draw_set_font(fInventoryBig);
	draw_set_color(c_dkgray);
	draw_text(94, 430, "HP");
	draw_text(94, 455, "MANA");
	
	draw_healthbar(175, 430, 394, 450, oPlayer.health, col_tan, c_gray, c_red, 0, true, true);
	draw_healthbar(175, 460, 394, 480, oPlayer.mana, col_tan, c_gray, c_blue, 0, true, true);
	
	draw_set_font(fStatbars);
	draw_set_color(c_white);
	draw_text(185, 430, string(oPlayer.health));
	draw_text(185, 460, string(oPlayer.mana));
}
