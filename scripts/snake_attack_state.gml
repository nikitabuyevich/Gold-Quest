/// snake_attack_state

// change to attack animation
image_speed = 0.1;
sprite_index = spr_snake_attack;

// make snake face player always
if (obj_Player.x < x)
    image_xscale = 1;
else
    image_xscale = -1;

// Look for the player
if (instance_exists(obj_Player)){
    var dis = point_distance(x, y, obj_Player.x, obj_Player.y);
    
    // snake sees the player
    if (dis > sightRange) {
        // Choose which direction to head
        state = choose(snake_move_right_state, snake_move_left_state);
    }
}
