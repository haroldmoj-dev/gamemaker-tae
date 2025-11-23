// Level 1 poop generator
if (fall_num == 1) {
	with (instance_create_layer(room_width+10, 648, "Poop", oPoopPractice)) {
		speed = 5;	
		direction = 180;
		image_xscale = 2;
		image_yscale = 2;
	}
} else {
	randomize();
	var random_y = irandom_range(616, 658);
	with (instance_create_layer(room_width+10, random_y, "Poop", oPoopPractice)) {
		speed = 5;	
		direction = 180;
		image_xscale = 2;
		image_yscale = 2;
	}	
}

alarm[3] = floor_3b;