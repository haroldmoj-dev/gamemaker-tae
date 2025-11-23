var key_down = keyboard_check(ord("S"));
var key_ranged = keyboard_check(ord("C"));

visible = false; // changed to poop
image_index = 3;
image_angle = point_direction(x, y, mouse_x, mouse_y);

// Show bow if not doing melee
if (oGamePVP.game_started && !oPlayer.is_dead && !oPlayer.melee_started) {
	
	// Display bow
	visible = false;
	x = oPlayer.x;
	y = oPlayer.y+11;

	// Shoot arrow
	firing_delay--;
	bow_recoil_timer = max(0, bow_recoil_timer - 1);
	if (key_ranged && firing_delay < 0 && oPlayer.respawn_timer == 0) {	
		
		// Player recoil
		oPlayer.recoil_x -= lengthdir_x(player_recoil_const, image_angle);
		oPlayer.recoil_y -= lengthdir_y(player_recoil_const, image_angle);
		
		bow_start_animation = true;
		bow_recoil_timer = bow_recoil_const;
		firing_delay = firing_delay_const;
		
		// Create arrow
		with (instance_create_layer(x, y, "Poop", oPoop)) {
			audio_play_sound(aPoop, 0, false);
			speed = 5; // 15	
			if (oPlayer.x_direction == 1) direction = 0;
			else if (oPlayer.x_direction == 0) direction = 180;
			if (oGamePVP.player1_apple_timer > 0) sprite_index = sPoopGolden;
			// image_angle = direction;
			image_xscale = 2;
			image_yscale = 2;
		}
	}

	// Bow recoil
	x -= lengthdir_x(bow_recoil_timer, image_angle);
	y -= lengthdir_y(bow_recoil_timer, image_angle);
	
	// Bow reloading animation
	if (bow_start_animation == true) {
		image_index = bow_current_frame;
		bow_delay_timer++;
	
		if (bow_delay_timer == bow_delay_const) {
			bow_current_frame++;	
			bow_delay_timer = 0;
			
			// Finish animation
			if (bow_current_frame >= sprite_get_number(sBow)-1) {
				bow_start_animation = false;
				bow_current_frame = 0;
			}
		}
	}

	// Recorrect orientation of bow
	if (image_angle > 90 && image_angle < 270) image_yscale = -2.4;	
	else image_yscale = 2.4;
}