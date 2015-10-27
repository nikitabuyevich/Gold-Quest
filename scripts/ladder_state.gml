/// ladder_state

/*
Player can press up to get on a ladder, and move up and down.
He can jump off whenever he wants to
*/

sprite_index = spr_player_ladder;

// stop animation when player stops moving
if (vSpd == 0)
    image_speed = 0;
else
    image_speed = 0.1;

// if we're not on the ladder, get out of the state
if (!place_meeting(x, y, obj_Ladder))
    state = move_state;

hSpd = 0; // don't have any initial horizontal movement speed
    
if (up || up_release){ 
    //vSpd = initialJumpH;
    state = free_fall_state;
}    
    
var thisLadder = instance_place(x, y, obj_Ladder);    


if (thisLadder != noone)
    obj_Player.x = abs(thisLadder.x - obj_Ladder.sprite_width/(12+2));


if (ladder_up || down){
   vSpd += (down - ladder_up)*global.ladderClimbAccelSpd;
   
   if (vSpd > global.ladderClimbMaxSpd)
      vSpd = global.ladderClimbMaxSpd;
      
   if (vSpd < -global.ladderClimbMaxSpd)
      vSpd = -global.ladderClimbMaxSpd;
} else
    apply_friction_vertical(global.ladderClimbAccelSpd);

if (!onLadderAnimation){
    onLadderAnimation = true;
    image_speed = 0.2;
    image_index = 0;   
}

// Vertical Collisions
if (place_meeting(x, y+vSpd, obj_edge_Solid)){
    while (!place_meeting(x, y+sign(vSpd), obj_edge_Solid)){
        y += sign(vSpd); 
    }
    
    vSpd = 0;
    
    state = move_state;
}
y += vSpd;





    
    
    
