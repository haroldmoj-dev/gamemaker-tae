// Hit a wall
if (!destroy && place_meeting(x, y, oWall)) {
	destroy = true;
}

// Hit a player
if (!destroy && place_meeting(x, y, oPlayerPractice)) {
	oPlayerPractice.respawn();
	oGamePractice.hit_num++;
	destroy = true;
}

// Out of bounds
if (direction == 0 && speed > 0) {
	if (x >= room_width+10) instance_destroy();
} else if (direction == 180 && speed > 0) {
	if (x <= -10) instance_destroy();
}

// Timer for self-destruction
if (destroy) {
	speed = 0;
	sprite_index = sPoopHit;
	destroy_timer--;
	if (destroy_timer <= 0) {
		instance_destroy();	
	}
}


