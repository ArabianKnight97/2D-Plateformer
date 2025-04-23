//draw myself
if(global.paused) {
	image_speed = 0
} else {
	image_speed = 1
}

draw_sprite_ext( sprite_index , image_index, x, y, image_xscale* face, image_yscale, image_angle, image_blend, image_alpha )