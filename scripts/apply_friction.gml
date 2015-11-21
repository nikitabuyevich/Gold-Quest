/// aapply_friction(amount)
/*
Used as friction physics to slow down movement if object
decides to stop moving.
*/
var amount = argument0;

var directionCorrected = sign(hSpd);

if (hSpd != 0) {
    if (abs(hSpd)-amount > 0 && !attacking) {
        hSpd -= amount*directionCorrected;
    } else {
        hSpd = 0;
    }
}

