// Transition out to PVP room
if (start_transition_out) {
	if (!instance_exists(oTransition)) {
		audio_stop_sound(aCupid);
		with instance_create_layer(room_width/2, room_height/2, "Top1", oTransition) {
			sprite_index = sTransitionOut;
			image_xscale = 18;
			image_yscale = 18;
		}
	}
	// If reached last image_index, change room
	if (oTransition.image_index >= sprite_get_number(sTransitionOut)-1) {
		start_transition_out = false;
		instance_destroy(oTransition);
		audio_stop_all();
		if (goto == 1) room_goto(rPractice);
		else if (goto == 2) room_goto(rPVP);
	}
}

// Transition in
if (start_transition_in) {
	if (!instance_exists(oTransition)) {
		audio_play_sound(aCupid, 0, true);
		with instance_create_layer(room_width/2, room_height/2, "Top1", oTransition) {
			sprite_index = sTransitionIn;
			image_xscale = 18;
			image_yscale = 18;
		}
	}		
	// If reached last image_index, delete transition obj
	if (oTransition.image_index >= sprite_get_number(sTransitionOut)-1) {
		// audio_play_sound(aCupid, 0, true);
		start_transition_in = false;
		instance_destroy(oTransition);
	}
}