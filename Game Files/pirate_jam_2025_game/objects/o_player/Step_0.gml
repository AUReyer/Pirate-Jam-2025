var sm = state_manager;
aiming = (sm.currentState == states.playerTurn and !running);

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
	var checkY = y+lengthdir_y(aimRadius,aimDir);
	aimLineLen = 0;
	
	image_xscale = 1;
	image_yscale = 1;
	image_angle = aimDir;
	while (wallInst == noone) {
		aimLineLen++;
		checkX+=lengthdir_x(1,aimDir);
		checkY+=lengthdir_y(1,aimDir);

		wallInst = instance_place(checkX,checkY,wall_parent);
	}
	image_xscale = 1;
	image_yscale = 1;
	image_angle = 0;
	
	if (aimLineLen < runSpd) aimNodeSizeTrgt = 0 else aimNodeSizeTrgt = 1;
	if (aimNodeSizeTrgt == 1) {
		if (!instance_exists(o_enem_aim_checker)) create(x,y,o_enem_aim_checker);
		with (o_enem_aim_checker) {
			image_angle = other.aimDir;
			image_xscale = other.aimLineLen+30;
		}
	} else {
		with (o_enem_aim_checker) instance_destroy();
	}
	
	aimNodeSize = lerp(aimNodeSize,aimNodeSizeTrgt,0.4);
	
	if (click(mb_left) and aimLineLen > runSpd) {
		launch();
		show_debug_message(aimLineLen);
	}
}

if (hitEnem) freeze_frame_manager.freeze(5);
hitEnem = false;

if (running) {
	drawAngle = aimDir;
	x+=lengthdir_x(runSpd,aimDir);
	y+=lengthdir_y(runSpd,aimDir);
	distanceTravelled = point_distance(x,y,startX,startY);
	
	if (place_meeting(x+lengthdir_x(runSpd,aimDir),y+lengthdir_y(runSpd,aimDir),wall_parent)) {
		while (!place_meeting(x+lengthdir_x(1,aimDir),y+lengthdir_y(1,aimDir),wall_parent)) {
			x+=lengthdir_x(1,aimDir);
			y+=lengthdir_y(1,aimDir);
		}
		running = false;
		aiming = true;
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
		
		drawAngle = baseDir;
		endTurnCool = 20;

	}
	
	if (!running and nextEnem != noone) {
		nextEnem = collidedEnems[array_length(collidedEnems)-1];
		hit_enemy(nextEnem);
		//x = lastX;
		//y = lastY;
		//baseDir = lastBasedir;
		//catchLastEnem = true;
	}
	
	// enemy collisions
	if (nextEnem != noone) {
		var trgtD = collidedEnemPositions[enemColInd];
		if (distanceTravelled > trgtD) hit_enemy(nextEnem);
		//var d = point_distance(x,y,nextEnem.x,nextEnem.y);
		//if (d <= 30) hit_enemy(nextEnem);
	}
	
	
	//if (hitEnem) game_end();
}

if (endTurnCool > 0) {
	endTurnCool--;
	if (endTurnCool == 0) state_manager.change_state(states.enemyTurn);
}


