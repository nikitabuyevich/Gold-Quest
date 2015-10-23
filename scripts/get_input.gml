///get_input
/*
Get input from keyboard or controller
*/
globalvar pushing;

right = keyboard_check(vk_right) || keyboard_check(ord('D'));
left = keyboard_check(vk_left) || keyboard_check(ord('A'));
door = keyboard_check_pressed(vk_up);
up = keyboard_check_pressed(vk_space);
up_release = keyboard_check_released(vk_space);
down = keyboard_check(vk_down);



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
