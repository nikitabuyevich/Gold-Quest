/// scr_settings();
// open up the settings file and read it
ini_open("settings.ini");
global.ambientSound = ini_read_real("sound", "ambient", 50);
global.effectSound = ini_read_real("sound", "effect", 50);
global.musicSound = ini_read_real("sound", "music", 50);
global.keyUp = ini_read_real("controls", "up", keyboard_get_map(vk_space));
global.keyDown = ini_read_real("controls", "down", keyboard_get_map(vk_down));
global.keyLeft = ini_read_real("controls", "left", keyboard_get_map(vk_left));
global.keyRight = ini_read_real("controls", "right", keyboard_get_map(vk_right));
ini_close();
