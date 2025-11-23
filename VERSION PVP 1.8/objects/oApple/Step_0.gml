// Touched apple
if (is_disappear == true) {
	sprite_index = sAppleWhite;
	disappear_timer--;
	if (disappear_timer <= 0) instance_destroy();
	
// Untouched apple
} else {
	// Player1 collision
	if (place_meeting(x, y, oPlayer)) {
		audio_play_sound(aPowerUp, 0, false);
		is_disappear = true;
		oGamePVP.player1_apple = true;
		with (instance_create_layer(oHPBar.x, oHPBar.y, "Bars", oSkillBar)) {
			image_xscale = 2.1;
			image_yscale = 2.1;
		}

	// Player2 collision
	} else if (place_meeting(x, y, oPlayer2)) {
		audio_play_sound(aPowerUp, 0, false);
		is_disappear = true;
		oGamePVP.player2_apple = true;
		with (instance_create_layer(oHPBar2.x, oHPBar2.y, "Bars", oSkillBar2)) {
			image_xscale = 2.1;
			image_yscale = 2.1;
		}
	}

	// Vertical collision
	if (place_meeting(x, y+y_speed, oWall)) {
		while (place_meeting(x, y+y_speed, oWall)) {
			y_speed--;	
		}
		y += y_speed;
		y_speed = 0;
	}

	// Update location
	y += y_speed;

	// Destroy apple if outside y
	if (y > room_height + 30) {
		instance_destroy();
	}
}
