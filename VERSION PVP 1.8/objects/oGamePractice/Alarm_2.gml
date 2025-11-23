// Level 1 poop generator
if (fall_num == 1) {
	with (instance_create_layer(261, 648, "Poop", oPoopPractice)) {
		speed = 5;	
		direction = 0;
		image_xscale = 2;
		image_yscale = 2;
	}
} else {
	randomize();
	var random_y = irandom_range(616, 658);
	with (instance_create_layer(261, random_y, "Poop", oPoopPractice)) {
		speed = 5;	
		direction = 0;
		image_xscale = 2;
		image_yscale = 2;
	}
}

alarm[2] = floor_3a;