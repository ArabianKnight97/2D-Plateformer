/// @description Insert description here
// You can write your code in this editor

// This deals with the horizontal borders
if(oPlayer.x < oPlayer.sprite_xoffset) {
	oPlayer.x = oPlayer.sprite_xoffset
} else if(oPlayer.x > room_width - oPlayer.sprite_xoffset) {
	oPlayer.x = room_width - oPlayer.sprite_xoffset
} else if(oPlayer.y > room_height) {
	oPlayer.y = room_height
} else if(oPlayer.y < oPlayer.sprite_yoffset) {
	oPlayer.y = oPlayer.sprite_yoffset
}
