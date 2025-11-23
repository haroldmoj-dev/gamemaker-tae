// Generate poop
randomize();
var random_y = irandom_range(310, room_height-150);
if (random_i == 0) {
	random_i = 1;
	with (instance_create_layer(-30, random_y, "Poop", oPoopHome)) {
		speed = 3;
		direction = 0;
		image_xscale = 5;
		image_yscale = 5;
	}
} else {
	random_i = 0;
	with (instance_create_layer(room_width+30, random_y, "Poop", oPoopHome)) {
		speed = 3;
		direction = 180;
		image_xscale = 5;
		image_yscale = 5;
	}		
}

// Loop
alarm[5] = 0.5 *60;