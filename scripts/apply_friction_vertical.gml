/// apply_friction_vertical(amount)
/*
Used as friction physics to slow down movement if object
decides to stop moving.
*/
var amount = argument0;

var directionCorrected = sign(vSpd);

if (vSpd != 0) {
    if (abs(vSpd)-amount < 0) {
        vSpd -= amount*directionCorrected;
    } else {
        vSpd = 0;
    }
}
