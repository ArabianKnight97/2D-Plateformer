if(place_meeting(self.x, self.y, oPlayer) == 1 && !global.paused) {
	oE_Key.visible = true
	oE_Key.x = self.x
} else {
	oE_Key.visible = false;
}	