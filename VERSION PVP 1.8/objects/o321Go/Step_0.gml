timer--;

// After 3 2 1
if (loop_counter == loop_const) {
	if (timer == 80) {
		oGamePVP.start_game();
		instance_destroy(oGray);
		instance_destroy();
	}
}

// Increment 3 2 1 Go
if (timer == 0) {
	image_index += 1;

	// At "GO!"
	if (image_index == 3) {
		image_xscale = 16;
		image_yscale = 16;	
	}
	
	// Before "GO!"
	if (image_index == 2) timer = timer_const - 0.2 *60;
	else timer = timer_const;
	
	loop_counter++;
}

