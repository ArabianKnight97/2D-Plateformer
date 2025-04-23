// Generates rabbits
for(i = 0; i < random_range(50,150); i += 1) {
	instance_create_depth(random_range(0, 2880), 208, 1, oRabbit)
}