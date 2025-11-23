// Increment level manually
var key_0 = keyboard_check_pressed(ord("0"));
if (key_0) fall_num++;

// Transition out
if (start_transition_out) {
	if (!instance_exists(oTransition)) {
		with (instance_create_layer(room_width/2, room_height/2, "Top", oTransition)) {
			sprite_index = sTransitionOut;
			image_xscale = 18;
			image_yscale = 18;
		}
	}
	// If reached last image_index, change room
	if (oTransition.image_index >= sprite_get_number(sTransitionOut)-1) {
		start_transition_out = false;
		instance_destroy(oTransition);
		audio_stop_sound(aSuperShy);
		room_goto(rHome);
	}
}

// Transition in
if (start_transition_in) {
	if (!instance_exists(oTransition)) {
		audio_play_sound(aSuperShy, 0, true);
		with (instance_create_layer(room_width/2, room_height/2, "Top", oTransition)) {
			sprite_index = sTransitionIn;
			image_xscale = 18;
			image_yscale = 18;
		}
		with (instance_create_layer(room_width -30, 30, "Settings", oHomeButton)) {
			image_speed = 0;
			image_xscale = 4;
			image_yscale = 4;
		}
		with (instance_create_layer(room_width -120, 30, "Settings", oRetryButton)) {
			image_speed = 0;
			image_xscale = 4;
			image_yscale = 4;
		} 
	}		
	// If reached last image_index, delete transition obj
	if (oTransition.image_index >= sprite_get_number(sTransitionOut)-1) {
		start_transition_in = false;
		instance_destroy(oTransition);
	}
}




