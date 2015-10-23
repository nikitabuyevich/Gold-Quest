/// move_state();

/*
Main part of the whole program. This is the state the players at most of the time. This is where
you should be checking things regularly.
*/


// Move character based on keyboard arrows
// and check for walls
if (right || left) {
    hSpd += (right-left)*accel;
    
    if (hSpd > maxSpd)
        hSpd = maxSpd;
    
    if (hSpd < -maxSpd)
        hSpd = -maxSpd;
} else {
    apply_friction(accel);
}

// Implementing gravity
if (!place_meeting(x, y+1, obj_inherit_Solid)){ // if we're in the air
    vSpd += grav;
    
    
        // Player is in the air
        //sprite_index = spr_player_jump;
       // image_speed = 0;
        //image_index = (vSpd > 0);
    
    
    // Control the jump height
    if (up_release && vSpd < initialJumpH) {
        vSpd = initialJumpH;
    }
} else { // on the ground
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
            sprite_index = spr_player_idle;
            
            
        }
        else {
            image_speed = 0.2;
            sprite_index = spr_player_walk;
        }
    } else // if we're attacking, stop movemenmt
        hSpd = 0;
} 






//flip character depending which was he's facing
if (hSpd != 0 && (right-left) != 0 && !attacking) {
    image_xscale = sign(right-left);
}

//scr_landing_sound(); //play landing sound

scr_push();

scr_move(hSpd, vSpd); // make sure theres no collisions
