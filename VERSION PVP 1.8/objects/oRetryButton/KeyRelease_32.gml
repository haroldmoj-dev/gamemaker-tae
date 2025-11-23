audio_play_sound(aClickOut, 0, false);

// Restart game
if (is_pressed) {
	if (room == rPVP) {
		if (oGamePVP.game_started) oGamePVP.restart_game();
	} else if (room == rPractice) {
		oPlayerPractice.respawn();
	}
}

is_pressed = false;
image_index = 0;

