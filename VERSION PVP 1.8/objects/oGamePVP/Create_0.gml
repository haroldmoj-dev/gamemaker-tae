// Home screen to PVP screen
start_transition_in = true;
start_transition_out = false;
activate_321 = false; // TOGGLE
game_start_timer = 0;
game_started = false;

// Players
player_hp_const = 6;
player1_hp = player_hp_const;
player2_hp = player_hp_const;
player1_wins = 0;
player2_wins = 0;

// Powerup generator
apple_time = 0;
generate_apple_at = -1;
generate_apple_min = 10 *60;
generate_apple_max = 10 *60;

// Powerup timer
apple_timer_const = 5 *60;
player1_apple = false;
player1_apple_timer = 0;
player2_apple = false;
player2_apple_timer = 0;

// Winner and loser
has_result = false;
result = 0;