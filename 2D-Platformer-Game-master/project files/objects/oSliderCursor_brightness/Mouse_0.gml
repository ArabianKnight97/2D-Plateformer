/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/// This sets the volume when the left mouse button is released

brightnessNorm = 0.5 + ((x - xstart)/(2*margin));
shader_set(shaderBrightness)

var _brightness = shader_get_uniform(shaderBrightness, "amount");
shader_set_uniform_f(_brightness, 0.5 - brightnessNorm);