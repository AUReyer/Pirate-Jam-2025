if (instance_exists(o_enem_aim_checker)) {
	if (place_meeting(x,y,o_enem_aim_checker)) aimedAt = true else aimedAt = false;
} else {
	aimedAt = false;
}