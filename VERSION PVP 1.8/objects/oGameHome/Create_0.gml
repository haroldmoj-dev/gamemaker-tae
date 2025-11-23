// Title
alarm[0] = 1.0 *60;
alarm[1] = 1.25 *60;
alarm[2] = 1.5 *60;
alarm[3] = 1.75 *60;
alarm[4] = 1.75 *60;
alarm[5] = 4.4 *60;


// Poop generator
random_i = 1;

// Transition
start_transition_in = true;
start_transition_out = false;
goto = 0;

// Mouse pointer
window_set_cursor(cr_none);
cursor_sprite = sMousePointer;

// Reset camera to default
view_enabled = false;
surface_resize(application_surface, room_width, room_height);

