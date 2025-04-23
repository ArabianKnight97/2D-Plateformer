/// @description This sets the volume when the left mouse button is released
// You can write your code in this editor

volumeNorm = 0.5 + ((x - xstart)/(2*margin));
audio_master_gain(volumeNorm);