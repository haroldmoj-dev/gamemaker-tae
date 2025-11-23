var key_0 = keyboard_check_pressed(ord("0"));
var key_1 = keyboard_check_pressed(ord("1"));
var key_2 = keyboard_check_pressed(ord("2"));

// HELPER FUNCTION - Switch camera
function switch_cam(n) {
	// Enable camera n
	view_visible[n] = true;
	
	// Disable other cameras
	if (n != 0) view_visible[0] = false;
	if (n != 1) view_visible[1] = false;
	if (n != 2) view_visible[2] = false;
	
	// Reset cameras 1 and 2 to zoom out
	cam_x = room_width;
	cam_y = room_height;
	camera_set_view_size(global.Camera1, cam_x, cam_y);
	camera_set_view_size(global.Camera2, cam_x, cam_y);
	
	// Add black padding
	// surface_resize(application_surface, CameraWidth, CameraHeight);	
}

// Switch cameras
if (key_0) switch_cam(0);
else if (key_1) switch_cam(1);
else if (key_2) switch_cam(2);

// Handle cam1
if (view_visible[1]) {
	camera_set_view_size(global.Camera1, cam_x, cam_y);
	// Zoom in
	if (cam_x > CameraWidth) {
		cam_x = cam_x * 0.98;
		cam_y = cam_y * 0.98;
	}
}

// Handle cam2
if (view_visible[2]) {
	camera_set_view_size(global.Camera2, cam_x, cam_y);
	// Zoom in
	if (cam_x > CameraWidth) {
		cam_x = cam_x * 0.98;
		cam_y = cam_y * 0.98;
	}
}
