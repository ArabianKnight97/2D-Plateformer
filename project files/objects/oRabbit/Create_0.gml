random_size = random_range(.8,2.8)
random_direction = random(1)


if(random_direction > 0.5) {
	random_direction = 	1
} else {
	random_direction = -1
}

self.image_xscale = random_size * random_direction
self.image_yscale = abs(random_size * random_direction)