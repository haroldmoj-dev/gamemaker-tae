// Camera settings for player zoom-in
#macro CameraWidth room_width/4
#macro CameraHeight room_height/4
#macro CameraScale 1
cam_x = room_width;
cam_y = room_height;

// 0 - Default camera

// 1 - Player1 camera slow zoom in
global.Camera1 = camera_create_view(oPlayer.x-(cam_x/2), oPlayer.y-(cam_y/2), cam_x, cam_y);
camera_set_view_border(global.Camera1, cam_x, cam_y);
camera_set_view_target(global.Camera1, oPlayer);
camera_set_view_speed(global.Camera1, -1, -1);
view_set_camera(1, global.Camera1);

// 2 - Player2 camera slow zoom in
global.Camera2 = camera_create_view(oPlayer2.x-(cam_x/2), oPlayer2.y-(cam_y/2), cam_x, cam_y);
camera_set_view_border(global.Camera2, cam_x, cam_y);
camera_set_view_target(global.Camera2, oPlayer2);
camera_set_view_speed(global.Camera2, -1, -1);
view_set_camera(2, global.Camera2);

// Camera 0 as default
view_enabled = true;
view_visible[0] = true;