/// move_state();

/*
Main part of the whole program. This is the state the players at most of the time. This is where
you should be checking things regularly.
*/

// Control variables with sprite_index
if (sprite_index != spr_player_push){
    pushing = false;
}

if (sprite_index != spr_player_jump){
    alarmStarted = false;
}

// Move character based on keyboard arrows
// and check for walls
if ((right || left) && !rolling) {
    
    if (!pushing)
        hSpd += (right-left)*global.accel;
    else
        hSpd = ((right-left)*maxSpd*global.blockPushSpeed);
    
    if (hSpd > maxSpd)
        hSpd = maxSpd;
    
    if (hSpd < -maxSpd)
        hSpd = -maxSpd;
} else if (!rolling) {
    apply_friction(global.accel);
}

// Implementing gravity
if (!place_meeting(x, y+1, obj_inherit_Solid)){ // if we're in the air
    vSpd += global.grav;
    
    if (!rolling){
        if (!attacking){
            // Player is in the air
            image_speed = 0;              
            sprite_index = spr_player_jump;
            if (!alarmStarted){ 
                alarm[0] = room_speed/9; // controls frame speed
                alarmStarted = true;
            }
            if (vSpd < 0){
                image_index = 0;
                if (alarm[0] <= 0){
                    image_index = 1; // with initial jump, go only to frames 1 to 2
                }
            } else
                image_index = 2;
        }
        
        // Control the jump height
        if (up_release && vSpd < initialJumpH) {
        
            if (place_meeting(x, y+vSpd, obj_inherit_Solid)){
                while (!place_meeting(x, y+sign(vSpd), obj_inherit_Solid)){
                    y += sign(vSpd);
                }
                vSpd = 0;
            } else
                vSpd = initialJumpH;
        }
    }
    
} else { // on the ground
    if (!rolling){
        if (!attacking){
            vSpd = 0;
            
            // Jumping
            if (up) { 
                vSpd = maxJumpH;
                    //audio_play_sound(snd_jump, 5, false);
            }
            
            // Player on the ground
            if (hSpd == 0){
                image_speed = 0.1;
                if (sprite_index != spr_player_idle && !pushing)
                    image_index = 0;
                sprite_index = spr_player_idle;
                
                
            }
            else {
                image_speed = 0.2;
                if (sprite_index != spr_player_walk && !pushing)
                    image_index = 0;
                sprite_index = spr_player_walk;
            }
        } else // if we're attacking, stop movemenmt
            hSpd = 0;
    }
} 


//flip character depending which was he's facing
if ((hSpd != 0) && ((right-left) != 0) && !attacking && !rolling) {
    image_xscale = sign(right-left);
}

//scr_landing_sound(); //play landing sound

if (!rolling)
    scr_push();

scr_move(hSpd, vSpd); // make sure theres no collisions
