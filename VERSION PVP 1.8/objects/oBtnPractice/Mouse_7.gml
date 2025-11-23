if (is_pressed) {
	// Reset play button
	audio_play_sound(aClickOut, 0, false);
	is_pressed = false;
	image_index = 0;

	// Do something
	if (!was_pressed) {
		was_pressed = true;
		oGameHome.goto = 2;
		oGameHome.start_transition_out = true;
	}
}