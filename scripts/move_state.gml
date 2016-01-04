/// move_state();

/*
Main part of the whole program. This is the state the players at most of the time. This is where
you should be checking things regularly.
*/

// Control variables with sprite_index
if (sprite_index != spr_player_push){
    pushing = false;
}

// Player is crouching
if (stayCrouched || (global.down && !attacking && !rolling && !global.left && !global.right)){
    hSpd = 0;
    crouching = true;
    mask_index = spr_player_mask_crouch; // change to crouch mask
    sprite_index = spr_player_crouch;
} else if (!rolling)
    default_mask();

// Move character based on keyboard arrows
// and check for walls
if ((global.right || global.left) && !rolling) {
    
    if (!pushing)
        hSpd += (global.right-global.left)*global.accel;
    else
        hSpd = ((global.right-global.left)*maxSpd*global.blockPushSpeed);
    
    if (hSpd > maxSpd)
        hSpd = maxSpd;
    
    if (hSpd < -maxSpd)
        hSpd = -maxSpd;
} else if (!rolling) {
    apply_friction(global.accel);
}

// Implementing gravity
if (!place_meeting(x, y+1, obj_parentSolid)){ // if we're in the air
    notOnGround = true;
    vSpd += global.grav;
    
    if (!rolling){
        if (!attacking){
            // Player is in the air
            if (vSpd < 0)
                sprite_index = spr_player_jump_a;
            else
                sprite_index = spr_player_jump_b;
            
        }
        
        // Control the jump height
        if ((global.up_release && vSpd < initialJumpH)) {
        
            if (place_meeting(x, y+vSpd, obj_parentSolid)){
                while (!place_meeting(x, y+sign(vSpd), obj_parentSolid)){
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
            if (!global.jumpThruPlat) {
               vSpd += global.grav; // add to gravity cause if jumping through mult. plats. it will not add grav. 
               if (vSpd > 0) 
                vSpd = 0;
            } else {
                global.jumpThruPlat = true;
                vSpd = 0;
            }
            
            // Jumping
            if (global.up) { 
                vSpd = maxJumpH;
                    //audio_play_sound(snd_jump, 5, false);
            }
            
            if (vSpd == 0 && place_meeting(x, y+1, obj_parentSolid))
                jumpAnimFinished = true;
            
            // Player on the ground
            if (jumpAnimFinished) {
                if (hSpd == 0 && vSpd == 0){
                    if (!crouching || global.jumpedThrough){
                        image_speed = 0.1;
                        if (sprite_index != spr_player_idle && !pushing)
                            image_index = 0;
                        sprite_index = spr_player_idle;
                    }
                }
                else {
                    image_speed = 0.2;
                    if (sprite_index != spr_player_walk && !pushing)
                        image_index = 0;
                    sprite_index = spr_player_walk;
                } 
            }
            
        } 
    }
} 


//flip character depending which was he's facing
if ((hSpd != 0) && ((global.right-global.left) != 0) && !rolling) {
    image_xscale = sign(global.right-global.left);
}

//scr_landing_sound(); //play landing sound

if (!rolling && !attacking)
    scr_push();

scr_move(hSpd, vSpd); // make sure theres no collisions

// Check for ledge grab state
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+5*image_xscale, yprevious, obj_parentSolid);
var is_wall = position_meeting(x+5*image_xscale, y, obj_parentSolid);
var noPushableBlock = !position_meeting(x+5*image_xscale, y, obj_parentPushableBlock);

if (falling && wasnt_wall && is_wall && noPushableBlock) {
    hSpd = 0;
    vSpd = 0;
    
    // Move against the ledge
    while (!place_meeting(x+image_xscale*0.5, y, obj_parentSolid)){
        x += image_xscale*0.5;
    }
    
    // Make sure we are the right height
    while (position_meeting(x+5*image_xscale, y-1, obj_parentSolid)){
        y -= 1;
    }
    
    //sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
    
    /*
    // Play the ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, 0.1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
    */
}
