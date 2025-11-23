x_scale = 2.4;
y_scale = 2.4;

image_xscale = -x_scale;
image_yscale = y_scale;

x_speed = 0;
y_speed = 0;
x_direction = 0;
walk_speed = 3;

jumps_const = 1;
available_jumps = jumps_const;
jump_height_const = -7;
grv_const = 0.32;
grv = grv_const;
speedfall_const = 0.96;

recoil_x = 0;
recoil_y = 0;
recoil_grv_const= grv_const;
recoil_grv = 0;

melee_started = false;
melee_direction = 1;
melee_animation_timer = 0;
melee_animation_const = 5;
melee_current_frame = 0;
melee_delay_timer = 0;
melee_delay_const = 30;

respawn_const = 40;
respawn_timer = respawn_const;

image_alpha_counter = 0;
image_alpha_const = 0.04;

is_dead = false;
death_sound_played = false;

restart_const = 0 *60;
restart_timer = restart_const;



