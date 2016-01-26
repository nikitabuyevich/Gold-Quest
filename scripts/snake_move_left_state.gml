/// snake_move_right_state

sprite_index = spr_snake_walk; // walk state

var wall_at_left = place_meeting(x-1, y, obj_parentSolid);
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, obj_parentSolid);

if (wall_at_left || ledge_at_left) {
    state = snake_move_right_state;
}

// Look for the player
if (instance_exists(obj_Player)){
    // if player gets in certain range, make the snake go towards the player until its attack range
    // and then go into the attack state

    if (foundPlayer)
        state = snake_attack_state;
}

// Control the snake aprite
image_xscale = 1;

// Move the snake

x -= moveSpeed;
