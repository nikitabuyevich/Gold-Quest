/// snake_chase_state

if (instance_exists(obj_Player)){
    var dir = point_direction(x, y, obj_Player.x, obj_Player.y);
    
    H_SPEED = lengthdir_x(CONST_SPEED/2, dir);
    V_SPEED = lengthdir_y(CONST_SPEED/2, dir);
    
    //change to the flying sprite
    sprite_index = spr_bat_fly;
    
    // Face the right direction
    if (H_SPEED != 0)
        image_xscale = sign(H_SPEED);
    
    // Move
        scr_move(obj_solid);
}
