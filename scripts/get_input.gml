///get_input
/*
Get input from keyboard or controller
*/


global.right = keyboard_check(global.keyRight);
global.left = keyboard_check(global.keyLeft);
global.ladder_up = keyboard_check(vk_up);
global.interact = keyboard_check_pressed(ord('E'));
global.up = keyboard_check_pressed(global.keyUp);
global.up_release = keyboard_check_released(global.keyUp);
global.down = keyboard_check(global.keyDown);



// Override the controls for a gamepad
var gp_id = 0;
var thresh = .5;


if (gamepad_is_connected(gp_id)) {
    right = gamepad_axis_value(gp_id, gp_axislh) > thresh;
    left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
    up = gamepad_button_check_pressed(gp_id, gp_face1);
    door = gamepad_button_check_pressed(gp_id, gp_face2);
    up_release = gamepad_button_check_released(gp_id, gp_face1);
    down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
    shoot_key = gamepad_button_check_pressed(gp_id, gp_face3);
    roll_key = gamepad_button_check_pressed(gp_id, gp_face2);
}
