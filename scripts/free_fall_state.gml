/// free_fall_state

/*
Fall to the ground and move in the air,
only colides with solid edges.
*/

if (global.right || global.left)
      image_xscale = sign(global.right-global.left);

if ((global.right || global.left)) {
    
    if (!pushing)
        hSpd += (global.right-global.left)*global.accel;
    else
        hSpd = ((global.right-global.left)*maxSpd*global.blockPushSpeed);
    
    if (hSpd > maxSpd)
        hSpd = maxSpd;
    
    if (hSpd < -maxSpd)
        hSpd = -maxSpd;
}
        
// Horizontal Collisions
if (place_meeting(x+hSpd, y, obj_outsideSolid)){
    while (!place_meeting(x+sign(hSpd), y, obj_outsideSolid)){
        x += sign(hSpd);
    }
    
    hSpd = 0;
} 
x += hSpd;

// Vertical Collisions
if (place_meeting(x, y+vSpd, obj_outsideSolid)){
    while (!place_meeting(x, y+sign(vSpd), obj_outsideSolid)){
        y += sign(vSpd); 
    }
    
    vSpd = 0;
    
    state = move_state;
}
y += vSpd;

// Implementing gravity
if (!place_meeting(x, y+1, obj_outsideSolid)){ // if we're in the air
    vSpd += global.grav;
    image_index = 2;
    sprite_index = spr_player_jump_b;
}
    
// if on the ground, go back to move state
if (vSpd == 0)
        state = move_state;
