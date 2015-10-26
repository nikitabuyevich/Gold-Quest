/// ladder_state

/*
Player can press up to get on a ladder, and move up and down.
He can jump off whenever he wants to
*/

// if we're not on the ladder, get out of the state
if (!place_meeting(x, y, obj_Ladder))
    state = move_state;

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

sprite_index = spr_player_ladder;

    
    
    
