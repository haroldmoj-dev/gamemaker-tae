var width_room = 1366;
var x_cloud = 0;
var y_cloud = 222.93;
var x_scale = 3.42;
var y_scale = 3.42;
var cloud_speed = 0.2;

// Move cloud to the right
x = x + cloud_speed;

// Delete cloud
if (x >= width_room) instance_destroy();

// Create another cloud
if (instance_number(oClouds2) == 1) {
	with (instance_create_layer(-width_room, y_cloud, "Clouds", oClouds2)) {
		image_xscale = x_scale;
		image_yscale = y_scale;
	}
} 
