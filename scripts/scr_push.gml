/// scr_push

// Horizontal push
if (place_meeting(x+(hSpd*global.blockPushSpeed), y, obj_inherit_pushable_Block)) {
    var block = instance_place(x+(hSpd*global.blockPushSpeed), y, obj_inherit_pushable_Block);
    with (block){
        scr_move(obj_Player.hSpd*global.blockPushSpeed, 0);
    }
    
    hSpd = (hSpd*global.blockPushSpeed);
}
