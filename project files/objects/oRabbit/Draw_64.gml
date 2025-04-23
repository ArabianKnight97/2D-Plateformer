num = random(10000)

if(num <= 10) {
	self.image_xscale = self.image_xscale * -1
} else {
	self.x += (self.image_xscale / abs(self.image_xscale)) * 0.4	
}