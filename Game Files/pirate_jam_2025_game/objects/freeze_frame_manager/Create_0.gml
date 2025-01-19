freezeFrameSpr = noone;

displayFreezeTime = 0;

function freeze(duration) {
	freezeFrameSpr = sprite_create_from_surface(application_surface,0,0,grid_w,room_height,false,false,0,0);
	displayFreezeTime = duration;
	
	instance_deactivate_region(0,0,grid_w,room_height,true,true);
	instance_activate_object(wall_parent);
	//instance_deactivate_object(o_camera);
	
}

