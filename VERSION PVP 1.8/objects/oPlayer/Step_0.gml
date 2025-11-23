// Player inputs
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));
var key_melee = keyboard_check(ord("O"));

// HELPER FUNCTION - Chooses a sprite
function choose_sprite(right) {
	sprite_index = right;
	if (x_direction == 1) image_xscale = x_scale;
	else if (x_direction == 0) image_xscale = -x_scale;
}

// HELPER FUNCTION - Checks if on floor
function on_floor() {
	if (place_meeting(x, y+1, oWall)) return true;
	else return false;
}

// HELPER FUNCTION - Handle horizontal collision
function x_collision() {
	if (place_meeting(x+x_speed, y, oWall)) {
		// Move until it hits the wall
		while(!place_meeting(x+sign(x_speed), y, oWall)) {
			x = x + sign(x_speed);
		}
		x_speed = 0;
	}
}

// HELPER FUNCTION - Handle vertical collision
function y_collision() {
	if (place_meeting(x, y+y_speed, oWall)) {
		// Move until it hits the wall
		while(!place_meeting(x, y+sign(y_speed), oWall)) {
			y = y + sign(y_speed);
		}
		y_speed = 0;
	}
}

// HELPER FUNCTION - Respawn
function respawn() {
	sprite_index = sPlayerIdleR;
	image_xscale = x_scale;
	image_alpha = 0;
	x_direction = 1;
	x = 193;
	y = 183;
	y_speed = 0;
	respawn_timer = respawn_const;
	audio_play_sound(aRevive, 0, false);
}

// LOGIC ******************************************************************************

respawn_timer = max(0, respawn_timer - 1);

// Identify as dead
if (respawn_timer == 0 && is_dead == false && oGamePVP.player1_hp <= 0) {
	audio_stop_sound(aMagnetic);
	is_dead = true;
	choose_sprite(sPlayerDieR);
	image_index = 0;
	y_speed = 0;
} 

// Death animation
if (is_dead == true) {
	if (image_index == 0 && death_sound_played == false) {
		audio_play_sound(aDeath, 0, false);
		death_sound_played = true;
	}
	if (image_index >= 5) {
		restart_timer = max(0, restart_timer - 1);
		image_index = 5;
	}
	y_speed += grv;
	y_collision();
	y = y + y_speed;
	
	// After dying
	if (restart_timer <= 0) {
		// something
	}
	
// Done respawning
} else if (respawn_timer == 0 && oGamePVP.game_started == true) {
	image_alpha_counter = 0;
	
	// No recoil if crouching
	if (key_down && on_floor()) {
		recoil_y = 0;
		recoil_x = 0;
	}

	// Calculate y movement
	if (recoil_y != 0) y_speed = recoil_y;
	else y_speed += grv;
	// Reset y recoil
	recoil_y = 0;

	// Calculate x movement
	var x_move = key_right - key_left;
	x_speed = x_move*walk_speed + recoil_x - sign(recoil_x)*recoil_grv;
	// Increment recoil gravity
	if (recoil_x != 0) recoil_grv += recoil_grv_const;
	else recoil_grv = 0;
	// Reset x recoil if done
	if (sign(recoil_x) < 0 && recoil_x - sign(recoil_x)*recoil_grv >= 0) recoil_x = 0;
	else if (sign(recoil_x) > 0 && recoil_x - sign(recoil_x)*recoil_grv <= 0) recoil_x = 0;	

	// Jump
	if (available_jumps > 0 && key_jump) {
		y_speed = jump_height_const;
		available_jumps--;
	}

	// Speed fall
	if (!on_floor() && key_down) {
		grv = speedfall_const;
	} else {
		grv = grv_const;
	}

	x_collision();
	y_collision();

	// Update location
	// If crouching, no movement
	if (on_floor() && key_down) {
		x_speed = 0;
		y_speed = 0;
	}
	x = x + x_speed;
	y = y + y_speed;

	// Update direction (facing left or right)
	if (x_speed > 0 || (key_down && key_right)) x_direction = 1;
	else if (x_speed < 0 || (key_down && key_left)) x_direction = 0;	

// ANIMATION ************************************************************************

	// Start melee atk
	melee_delay_timer = max(0, melee_delay_timer - 1);
	if (key_melee && melee_delay_timer == 0) {
		audio_play_sound(aSlash, 0, false);
		melee_direction = x_direction;
		melee_delay_timer = melee_delay_const;
		melee_started = true;
		oBow.visible = false;
	
		melee_current_frame = 0;
	}

	// If did not melee atk
	if (melee_started == false) {
		if (!on_floor()) {
			// Falling
			if (sign(y_speed) > 0) choose_sprite(sPlayerFallR);	
			// Jumping
			else if (sign(y_speed) < 0) choose_sprite(sPlayerJumpR);	
		
		} else {
			// Reset jump counter
			available_jumps = jumps_const;
			// Crouch
			if (key_down) choose_sprite(sPlayerCrouchR);
			// Running
			else if (sign(x_speed != 0)) choose_sprite(sPlayerRunR);
			// Idle
			else choose_sprite(sPlayerIdleR);
		}

	// If melee atk
	} else if (melee_started == true) {
	
		// Crouching melee atk
		if (key_down && on_floor()) choose_sprite(sPlayerAtkCrouchR); // melee_direction
		// Non-crouching melee atk
		else choose_sprite(sPlayerAtkR); // melee_direction
	
		image_index = melee_current_frame;
		melee_animation_timer ++;
	
		// Increment frame
		if (melee_animation_timer == melee_animation_const) {
			melee_current_frame ++;	
			melee_animation_timer = 0;
		}
	
		// Finish animation
	    if (melee_current_frame >= sprite_get_number(sPlayerAtkR)) {
	        melee_started = false;
	        melee_current_frame = 0;
			melee_animation_timer = 0;
	    }
	}

	// Ceiling for y
	if (y < 26) y = 26;

	// Respawn if outside y
	if (y > room_height + 300) {
		oGamePVP.player1_hp--;
		respawn();
	}

	// Portal if outside x
	if (x < -10) x = room_width + 5;
	else if (x > room_width + 10) x = -5;
	
// Still respawning
} else {
	
	// Respawn animation
	image_alpha = min(1, image_alpha_counter);
	image_alpha_counter += image_alpha_const;
}

// Game counting down and finished spawning
if (respawn_timer == 0 && oGamePVP.game_started == false) {
	y_speed += grv;
	y_collision();
	y = y + y_speed; 
	if (key_down && on_floor()) {
		choose_sprite(sPlayerCrouchR);
	} else {
		choose_sprite(sPlayerIdleR);
	}
}



