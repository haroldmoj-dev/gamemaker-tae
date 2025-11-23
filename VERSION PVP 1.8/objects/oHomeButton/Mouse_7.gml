audio_play_sound(aClickOut, 0, false);
is_pressed = false;
image_index = 0;

if (!was_pressed) {
	// Go to home
	was_pressed = true;
	if (room == rPVP) oGamePVP.start_transition_out = true;
	else if (room == rPractice) oGamePractice.start_transition_out = true
}