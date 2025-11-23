if (deadly_timer != 0) deadly_timer--;

/*/ Hit a wall
if (place_meeting(x, y, oWall)) {
	speed = 0;
	timer--;
	
	// Fall if there's no floor below
	if (place_meeting(x, y-10, oWall)) fall = true; // flawed logic
	else {
		fall = false;
		var adjust = 0;
		while (place_meeting(x, y-adjust, oWall)) {
			adjust++;
		}
		y = y-adjust;
	}
}*/

// Hit player
var sound_played = false;
if (deadly_timer == 0 && place_meeting(x, y, oPlayer)) {

	// Damage the player
	if (sprite_index == sPoopGolden) oGamePVP.player1_hp = max(0, oGamePVP.player1_hp - 2);
	else oGamePVP.player1_hp = max(0, oGamePVP.player1_hp - 1);
	
	// Prepare for poop disappear
	if (sound_played = false) {
		audio_play_sound(aDie, 0, false);
		sound_played = true;
	}
	if (sprite_index = sPoopGolden) sprite_index = sPoopGoldenHit;
	else sprite_index = sPoopHit;
	is_hit = true;
	speed = 0;
	deadly_timer = -1;
	
// Hit another poop
} else if (deadly_timer == 0 && place_meeting(x, y, oPoop)) {
	
	var will_destroy = false;
	
	// Golden poop
	if (sprite_index == sPoopGolden) {
		
		// Golden poop VS. Golden poop
		var other_poop = instance_place(x, y, oPoop);
		if (other_poop.sprite_index == sPoopGolden || other_poop.sprite_index == sPoopGoldenHit) will_destroy = true;		
	
	// Normal poop
	} else will_destroy = true;
	
	if (will_destroy) {
		if (sound_played = false) {
			audio_play_sound(aDie, 0, false);
			sound_played = true;
		}
		if (sprite_index = sPoopGolden) sprite_index = sPoopGoldenHit;
		else sprite_index = sPoopHit;
		is_hit = true;
		speed = 0;
		deadly_timer = -1;	
	}
}

// Poop disappear animation
if (is_hit) {
	destroy--;
	if (destroy <= 0) instance_destroy();
}

// Fall
if (fall) {
	y = y + poop_grv_const;
}

// Hit full screen
if (place_meeting(x, y, oFullScreen)) {
	if (timer == timer_const) {
		if (window_get_fullscreen()) {
			oFullScreen.image_index = 0;
			window_set_fullscreen(false);
		} else {
			oFullScreen.image_index = 1;
			window_set_fullscreen(true);	
		}
	}
	speed = 0;
	timer--;
}

// Destroy poop if outside y
if (y < -5 || y > room_height + 5) {
	instance_destroy();
}

// Destroy poop if outside x
if (x < -5 || x > room_width + 5) {
	instance_destroy();
}

/*/ Portal if outside y
if (y < -5) y = room_height + 2;
else if (y > room_height + 5) y = -2;

// Portal if outside x
if (x < -5) x = room_width + 2;
else if (x > room_width + 5) x = -2; */

// Won't happen
if (timer == 0) instance_destroy();