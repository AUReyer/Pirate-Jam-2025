if (instance_exists(o_enem_aim_checker)) {
	if (place_meeting(x,y,o_enem_aim_checker)) aimedAt = true else aimedAt = false;
} else {
	aimedAt = false;
}

// movement
if (moving) {
	x = lerp(x,trgtX,moveSpd);
	y = lerp(y,trgtY,moveSpd);
	if (point_distance(x,y,trgtX,trgtY) <= 1) {
		moving = false;
		x = trgtX;
		y = trgtY;
		state_manager.enemCountdown = true;
	}
}