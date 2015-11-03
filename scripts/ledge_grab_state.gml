/// ledge_grab_state()
/*
Grabs onto a ledge, press up to jump or down to fall.
*/


if (global.down) {
    state = move_state;
}

if (global.up) {
    state = move_state;
    vSpd = maxJumpH;
}
