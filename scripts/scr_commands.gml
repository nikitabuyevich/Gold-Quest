/// list of commands to use when in debug mode

if (console_submit(cmd)) {
    
            // <== DEBUG == >
    
    // set debug to true or false with debug, 1/0
    if (console_cmd(cmd, "debug"))
        global.debug = console_value(cmd, 1);
    
            // <== PLAYER == >
    
    // go to next room if it exists
    else if (console_cmd(cmd, "room_next")) { 
        if room_next(room) != -1 {
                room_goto(room_next(room));
        } else
            room_goto(rm_1);
            
        scr_origin_player();
    }
            
    // center the player in the middle of the screen
    else if (console_cmd(cmd, "origin_player")) {
        scr_origin_player();
    }
    
    // move player to the specific coordinates or where mouse is at
    else if (console_cmd(cmd, "move_player")) {
        movePlayer = true;
        alarm[0] = 1;
    }
    
    // change the speed at which the player runs
    else if (console_cmd(cmd, "player_speed")) {
        player_speed = true;
        alarm[0] = 1;
    }
    
    // change how tall the player jumps
    else if (console_cmd(cmd, "player_jump")) {
        player_jump = true;
        alarm[0] = 1;
    }
    
            // <== ROOMS == >
    
    // go to the room specified
    else if (console_cmd(cmd, "room")) {
        room_goto(console_value(cmd, 1));
        
        scr_origin_player();
    }       
    
    // start back at the first room
    else if (console_cmd(cmd, "room_start")) {
        room_goto(rm_1);
        scr_origin_player();
    }
    
    // restart the room
    else if (console_cmd(cmd, "room_restart")) {
        room_goto(asset_get_index(room_get_name(room)));
        scr_origin_player();
    }
    
    // go to next room that's set
    else if (console_cmd(cmd, "room_leap")) {
        if (room == rm_1)
            room_goto(rm_town__mainstreet);
        else if (room == rm_town__mainstreet)
            room_goto(rm_town_castlestreet);
        else if (room == rm_town_castlestreet)
            room_goto(rm_town_farm);
        else if (room == rm_town_farm)
            room_goto(rm_1);
            
        scr_origin_player();
    }
    else 
        console_toggle(cmd);
}
