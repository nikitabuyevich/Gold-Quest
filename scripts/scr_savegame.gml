/// scr_savegame();

if (file_exists("File.save")) // delete the save
    file_delete("File.save");
    
ini_open("File.save"); // Create the file again
var save1 = sha1_string_utf8("Save1");
var keyRoom = sha1_string_utf8("room")
var keyScore = sha1_string_utf8("score")

var savedRoom = base64_encode(string(room));
var savedScore = base64_encode(string(score));

ini_write_string(save1, keyRoom, savedRoom);
ini_write_string(save1, keyScore, savedScore);
ini_close();
 
