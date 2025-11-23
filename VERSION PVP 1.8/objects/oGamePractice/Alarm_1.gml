// Level 1 poop generator
if (fall_num == 1) {
	with (instance_create_layer(-10, 422, "Poop", oPoopPractice)) {
		speed = 5;	
		direction = 0;
		image_xscale = 2;
		image_yscale = 2;
	}
} else {
	randomize();
	var random_y = irandom_range(390, 432);
	with (instance_create_layer(-10, random_y, "Poop", oPoopPractice)) {
		speed = 5;	
		direction = 0;
		image_xscale = 2;
		image_yscale = 2;
	}
}

alarm[1] = floor_2;