if (k("4")) freeze(10);

if (displayFreezeTime > 0) {
	displayFreezeTime--;
	if (displayFreezeTime == 0) {
		with (o_player) {
			//x = frozenX;
			//y = frozenY;
		}
		instance_activate_region(0,0,grid_w,room_height,true);
		//instance_activate_object(o_camera);
	}
}