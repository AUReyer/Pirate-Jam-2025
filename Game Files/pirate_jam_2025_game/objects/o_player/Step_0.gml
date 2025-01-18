if (aiming) {
	var mouseDir = point_direction(x,y,mouse_x,mouse_y);
	/*anglDif = angle_difference(mouseDir,baseDir);
	if (abs(anglDif) < aimRange/2) 	{
		aimDir = mouseDir;
	} else {
		aimDir = baseDir+aimRange/2*sign(anglDif);
	}*/
	if (point_distance(x,y,mouse_x,mouse_y) > 3) aimDir = mouseDir;

	var wallInst = noone;
	var checkX = x+lengthdir_x(aimRadius,aimDir);
	var checkY = y+lengthdir_y(aimRadius,aimDir);;
	aimLineLen = 0;

	while (wallInst == noone) {
		aimLineLen++;
		checkX+=lengthdir_x(1,aimDir);
		checkY+=lengthdir_y(1,aimDir);
		wallInst = instance_place(checkX,checkY,wall_parent);
	}
	
	if (aimLineLen < runSpd) aimNodeSizeTrgt = 0 else aimNodeSizeTrgt = 1;
	
	aimNodeSize = lerp(aimNodeSize,aimNodeSizeTrgt,0.4);
}


if (running) {
	x+=lengthdir_x(runSpd,aimDir);
	y+=lengthdir_y(runSpd,aimDir);
	
	if (place_meeting(x+lengthdir_x(runSpd,aimDir),y+lengthdir_y(runSpd,aimDir),wall_parent)) {
		while (!place_meeting(x+lengthdir_x(1,aimDir),y+lengthdir_y(1,aimDir),wall_parent)) {
			x+=lengthdir_x(1,aimDir);
			y+=lengthdir_y(1,aimDir);
		}
		running = false;
		//aiming = true;
		aimNodeSize = 0.1;
		
		// set dir
		if (place_meeting(x+1,y,wall_parent)) baseDir = 180;
		if (place_meeting(x-1,y,wall_parent)) baseDir = 0;
		if (place_meeting(x,y+1,wall_parent)) baseDir = 90;
		if (place_meeting(x,y-1,wall_parent)) baseDir = 270;
		
		switch (baseDir) {
			case 0: o_camera.camHspd = 3; break;
			case 90: o_camera.camVspd = -3; break;
			case 180: o_camera.camHspd = -3; break;
			case 270: o_camera.camVspd = 3; break;
		}
	}
	
}


drawAngle = baseDir;

if (aiming and click(mb_left) and aimLineLen > runSpd) {
	launch();
	show_debug_message(aimLineLen);
}