// Destroy poop or make poop golden
if (direction == 0) {
	if (x >= room_width/2) sprite_index = sPoopSpecial;
	else if (x > room_width + 5) instance_destroy();
} else if (direction == 180) {
	if (x <= room_width/2) sprite_index = sPoopSpecial;
	else if (x < -5) instance_destroy();
}

// Destroy on collision
if (place_meeting(x, y, oTitle) ||
	place_meeting(x, y, oBtnPVP) ||
	place_meeting(x, y, oBtnPractice) ||
	place_meeting(x, y, oBtnNA)) {
	destroy_timer--;
	speed = 0;
	sprite_index = sPoopHit;	
	if (destroy_timer <= 0) instance_destroy();
}