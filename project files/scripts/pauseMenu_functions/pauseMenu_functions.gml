// Not paused by default.
global.paused = false;

// Declare pause function.
function pause() 
{
	// Pause the game.
	global.paused = true;

	// Apply the following code to all instances...
	with (all) 
	{
		// Save the instance's speed.
		paused_speed = speed;
	
		// Save the animation speed.
		paused_animation = image_speed;
	
		// Stop moving the instance.
		speed = 0;
	
		// Stop animation.
		image_speed = 0;
		
		
	}
	
	// Draws the menu
	layer_create(-100, "Menu")
	layer_create(-101, "Buttons")
	layer_create(-102, "Sliders")
	
	
	
	
	
	// Creates the button objects
	var x_view = camera_get_view_x(view_camera[0]);
	var y_view = camera_get_view_y(view_camera[0]);
	layer_sprite_create("Menu",x_view, y_view, pause_menu)
	
	instance_create_layer(120 + x_view, 64 - y_view, "Buttons", oButton_resume);
	oButton_resume.image_xscale = 0.9;
	oButton_resume.image_yscale = 0.9;
	instance_create_layer(120 + x_view, 136 - y_view, "Buttons", oButton_settings);
	oButton_settings.image_xscale = 0.9;
	oButton_settings.image_yscale = 0.9;
	instance_create_layer(120 + x_view, 208 - y_view, "Buttons", oButton_exit);
	oButton_exit.image_xscale = 0.9;
	oButton_exit.image_yscale = 0.9;
	
	// Creates the sliders
	instance_create_layer(340 + x_view, 136 - y_view, "Buttons", oSlider_volume);
	instance_create_layer(340 + x_view, 136 - y_view, "Sliders", oSliderCursor_volume);
	oSlider_volume.image_xscale = 0.9;
	oSlider_volume.image_yscale = 0.9;
	oSliderCursor_volume.image_xscale = 0.9;
	oSliderCursor_volume.image_yscale = 0.9;
	
	
	instance_create_layer(340 + x_view, 200 - y_view, "Buttons", oSlider_brightness);
	instance_create_layer(340 + x_view, 200 - y_view, "Sliders", oSliderCursor_brightness);
	oSlider_brightness.image_xscale = 0.9;
	oSlider_brightness.image_yscale = 0.9;
	oSliderCursor_volume.image_xscale = 0.9;
	oSliderCursor_volume.image_yscale = 0.9;
}

// Declare unpause function.
function unpause() 
{
	// Unpause.
	global.paused = false;
	layer_destroy("Menu")
	layer_destroy("Buttons")
	layer_destroy("Sliders")

	// Apply to all instances.
	with (all) 
	{	
		// Set speed to saved speed.
		speed = paused_speed;
	
		// Set animation speed to saved value.
		image_speed = paused_animation;
	}
}