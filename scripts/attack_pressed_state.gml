/// attack_pressed_state

image_speed = 0.15;
scr_change_sprite(spr_player_attack_a);

// Implementing gravity
if (!place_meeting(x, y+1, obj_inherit_Solid)){
    vSpd += grav;
    
    
        // Player is in the air
        //sprite_index = spr_player_jump;
       // image_speed = 0;
        //image_index = (vSpd > 0);
    
    
    // Control the jump height
    if (up_release && vSpd < initialJumpH) {
        vSpd = initialJumpH;
    }
}

// Vertical Collisions
if (place_meeting(x, y+vSpd, obj_inherit_Solid)){
    while (!place_meeting(x, y+sign(vSpd), obj_inherit_Solid)){
        y += sign(vSpd);
    }
    vSpd = 0;
}
y += vSpd;

if image_speed > 0
    if (image_index > image_number - 1)
        state = move_state;
    

