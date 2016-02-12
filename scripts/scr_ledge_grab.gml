/// scr_ledge_grab()

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
