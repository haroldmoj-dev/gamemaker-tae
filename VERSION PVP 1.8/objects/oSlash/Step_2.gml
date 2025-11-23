x = oPlayer.x;
y = oPlayer.y;

var sound_played = false;

with (oPoop) {
	// Trigger start of poop death
	if (oPlayer.melee_started) {
		if (place_meeting(x, y, other)) {
			destroy_start = true;
		}
	}
	
	// Poop death animation
	if (destroy_start) {
		if (destroy = destroy_const) {
			if (sound_played = false) {
				audio_play_sound(aDie, 0, false);
				sound_played = true;
			}
		}
		destroy--;
		sprite_index = sPoopHit;
		if (destroy <= 0)	{
			oGamePVP.num_poop_cleaned++;
			instance_destroy();
		}	
	}
}
