/// scr_commands_help()

// set debug to true or false with debug, 1/0
console_add(cmd, "debug, 1/0");

// origin the player object in case it's out of bounce
console_add(cmd, "origin_player");

// move the player to certain x y coordinates or where mouse is at
console_add(cmd, "move_player, x, y (or to mouse if unspecified)");

// go to next room if it exists
console_add(cmd, "room_next");

// go to next room that's set up
console_add(cmd, "room_leap");

// go to room where the game starts
console_add(cmd, "room_start");

// go to the room specified
console_add(cmd, "room, i");

// change the speed at which the player runs
console_add(cmd, "player_speed, i");

// change how tall the player jumps
console_add(cmd, "player_jump, i");
