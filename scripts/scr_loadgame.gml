/// scr_loadgame();
if (file_exists("File.save")){
    ini_open("File.save");
    var save1 = sha1_string_utf8("Save1");
    var keyRoom = sha1_string_utf8("room")
    var keyScore = sha1_string_utf8("score")
    var loadedRoom = ini_read_string(save1, keyRoom, "0");
    var loadedScore = ini_read_string(save1, keyScore, "0");
    loadedRoom = real(base64_decode(loadedRoom));
    score = real(base64_decode(loadedScore));
    ini_close();
    
    room_goto(loadedRoom);
} else {
 // if file doesn't exist do stuff here
}
