// HELPER FUNCTION - Restart game
function restart_game(){
	
	// Reset camera
	oCamera.switch_cam(0);
	
	// Stop stacking of revive sound
	audio_stop_sound(aRevive);
	
	// Play song if not playing
	if (!audio_is_playing(aMagnetic)) {
		audio_play_sound(aMagnetic, 0, true);
	}
	
	// Remove all apples and poop
	instance_destroy(oPoop);
	instance_destroy(oPoop2);
	instance_destroy(oApple);
	
	// Reset apple timer
	apple_time = 0;
	
	// Reset player
	has_result = false;
	player1_hp = player_hp_const;
	player2_hp = player_hp_const;
	player1_apple_timer = 0;
	player2_apple_timer = 0;	
	oPlayer.is_dead = false;
	oPlayer2.is_dead = false;
	oPlayer.death_sound_played = false;
	oPlayer2.death_sound_played = false;
	oPlayer.image_alpha_counter = 0;
	oPlayer2.image_alpha_counter = 0;
	oPlayer.respawn();
	oPlayer2.respawn();
}

// HELPER FUNCTION - Start game
function start_game(){
	game_started = true;
	/*if (!activate_321 && !activate_transition_in) {
		oPlayer.x = 193;
		oPlayer.y = 183;
		oPlayer2.x = 1184;
		oPlayer2.y = 183;
	}*/
}

// Transition in
if (start_transition_in && !game_started) {
	// Add gray for 321
	if (!instance_exists(oGray) && activate_321) {
		with (instance_create_layer(room_width/2, room_height/2, "Top2", oGray)) {
			sprite_index = sTransitionIn;
			image_xscale = 18;
			image_yscale = 18;
			image_speed = 0;
			image_index = 0;
			image_alpha = 0.7;
		}
	}
	// Start transition in + display buttons
	if (!instance_exists(oTransition)) {
		with (instance_create_layer(room_width/2, room_height/2, "Top", oTransition)) {
			sprite_index = sTransitionIn;
			image_xscale = 18;
			image_yscale = 18;
		}
		with (instance_create_layer(room_width -30, 30, "Settings", oHomeButton)) {
			image_speed = 0;
			image_xscale = 4;//3
			image_yscale = 4;//3
		}
		with (instance_create_layer(room_width -120, 30, "Settings", oRetryButton)) {
			image_speed = 0;
			image_xscale = 4;
			image_yscale = 4;
		} 
	}
	// If reached last image_index, start the game
	if (oTransition.image_index >= sprite_get_number(sTransitionIn)-1) {
		start_transition_in = false;
		instance_destroy(oTransition);
		if (!activate_321) {
			audio_play_sound(aMagnetic, 0, true);
			start_game();
		}
	}
	
// 321 animation
} else if (!start_transition_in && activate_321 && !game_started) {
	if (game_start_timer == 0) {
		audio_play_sound(aMagnetic, 0, true);
	}
	game_start_timer++;
	if (game_start_timer == 1.2 *60) {
		with (instance_create_layer(room_width/2, room_height/2, "Top1", o321Go)) {
			image_xscale = 13;
			image_yscale = 13;
			image_speed = 0;
		}
	}
	
// Start pvp if no 321 animation
} else if (!game_started) {
	audio_play_sound(aMagnetic, 0, true);
	start_game();
	
// Game started
} else if (game_started == true) {
	apple_time++;
	player1_apple_timer = max(0, player1_apple_timer-1);
	player2_apple_timer = max(0, player2_apple_timer-1);

	// Apple time manager
	if (apple_time == 1) {
		randomize();
		generate_apple_at = int64(random_range(generate_apple_min, generate_apple_max));
	}

	// Generate apple
	if (generate_apple_at == apple_time) {
		apple_time = 0;
		var x_apple = random_range(40, room_width-40);
		var y_apple = -50;
		with (instance_create_layer(x_apple, y_apple, "Powerups", oApple)) {
			image_xscale = 2.4;
			image_yscale = 2.4;
		}
	}

	// Activate apple ability timer
	if (player1_apple == true) {
		player1_apple_timer = apple_timer_const;
		player1_apple = false;
	}

	if (player2_apple == true) {
		player2_apple_timer = apple_timer_const;
		player2_apple = false;
	}
	
	// Winner and loser
	if (!has_result) {
		// Draw
		if (oPlayer.is_dead && oPlayer2.is_dead) {
			has_result = true;
			result = 0;
		// Player1 wins
		} else if (!oPlayer.is_dead && oPlayer2.is_dead) {
			//oCamera.switch_cam(2);
			has_result = true;
			result = -1;
			player1_wins++;
		// Player2 wins
		} else if (oPlayer.is_dead && !oPlayer2.is_dead) {
			//oCamera.switch_cam(1);
			has_result = true;
			result = 1;
			player2_wins++;
		}
	}
}

// Transition out
if (start_transition_out) {
	if (!instance_exists(oTransition)) {
		audio_stop_sound(aMagnetic);
		with (instance_create_layer(room_width/2, room_height/2, "Top", oTransition)) {
			sprite_index = sTransitionOut;
			image_xscale = 18;
			image_yscale = 18;
		}
	}
	// If reached last image_index, go to home
	if (oTransition.image_index >= sprite_get_number(sTransitionIn)-1) {
		start_transition_out = false;
		instance_destroy(oTransition);
		room_goto(rHome);
	}
}














