/// scr_push

// Horizontal push
if (place_meeting(x+((right-left)*maxSpd*global.blockPushSpeed), y, obj_inherit_pushable_Block)) {
    
    if (!pushing){
        pushing = true;
        image_speed = 0.2;
        image_index = 0;
        
    }
    sprite_index = spr_player_push;
    
    

    var block = instance_place(x+((right-left)*maxSpd*global.blockPushSpeed), y, obj_inherit_pushable_Block);
    with (block){
        scr_move(obj_Player.hSpd, 0);
    }
    
    
}  

