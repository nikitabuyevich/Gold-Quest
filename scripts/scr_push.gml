/// scr_push

// Horizontal push
if (place_meeting(x+((global.right-global.left)*maxSpd*global.blockPushSpeed), y, obj_parentPushableBlock)) {
    
    if (!pushing){
        pushing = true;
        image_speed = 0.2;
        image_index = 0;
        
    }
    sprite_index = spr_player_push;
    
    

    var block = instance_place(x+((global.right-global.left)*maxSpd*global.blockPushSpeed), y, obj_parentPushableBlock);
    with (block){
        scr_move(obj_Player.hSpd, 0);
    }
    
    
}  

