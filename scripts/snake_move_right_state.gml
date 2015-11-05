/// snake_move_right_state

sprite_index = spr_snake_walk; // walk state

var wall_at_right = place_meeting(x+1, y, obj_parentSolid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, obj_parentSolid);

if (wall_at_right || ledge_at_right) {
    state = snake_move_left_state;
}

// Look for the player
if (instance_exists(obj_Player)){
    var dis = point_distance(x, y, obj_Player.x, obj_Player.y);
    
    // snake sees the player
    if (dis < sightRange) {
        state = snake_attack_state;
    }
}


// Control the snake aprite
image_xscale = -1;

// Move the snake

x += snakeSpeed;
