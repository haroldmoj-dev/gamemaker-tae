// Reset camera to default
view_enabled = false;
surface_resize(application_surface, room_width, room_height);

// Home screen to PVP screen
start_transition_in = true;
start_transition_out = false;

// Player stats
fall_num = 1;
hit_num = 0;

// Poop generation speed (Level 1)
floor_const = 0;
floor_1 = 0.6 *60;
floor_2 = 1.0 *60;
floor_3a = 1.8 *60;
floor_3b = 1.8 *60;

// Poop generator
alarm[0] = floor_1;
alarm[1] = floor_2;
alarm[2] = floor_3a;
alarm[3] = floor_3b;

