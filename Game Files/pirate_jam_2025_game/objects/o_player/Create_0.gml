event_inherited();
depthCoord = ground_depth+10;

drawAngle = 0;
aiming = true;
running = false;
aimDir = 0;

runSpd = 20;

aimRange = 140;
baseDir = 0;
anglDif = 0;
aimNodeSize = 0;
aimLineLen = 0;
aimNodeSizeTrgt = 1;
collidedEnems = [];
collidedEnemPositions = [];

aimRadius = 16;
enemColInd = 0;
nextEnem = noone;
hitEnem = false;
distanceTravelled = 0;
startX = 0;
startY = 0;

frozenX = 0;
frozenY = 0;

catchLastEnem = false;

endTurnCool = 0;

function launch() {
	state_manager.change_state(states.playerTurnExecuting);
	with (o_enem_aim_checker) instance_destroy();
	aiming = false;
	running = true;
	collidedEnems = [];
	collidedEnemPositions = [];
	distanceTravelled = 0;
	enemColInd = 0;
	startX = x;
	startY = y;
	catchLastEnem = false;
	
	with (create(x,y,o_enem_checker)) {
		image_xscale = 1;
		image_angle = other.aimDir;
		while (image_xscale < other.aimLineLen) {
			var checkX = x+lengthdir_x(image_xscale,image_angle);
			var checkY = y+lengthdir_y(image_xscale,image_angle);
			var inst = instance_place(checkX,checkY,enemy_parent);
			if (inst != noone and !array_contains(other.collidedEnems,inst)) array_push(other.collidedEnems,inst);
			image_xscale++;
		}
		instance_destroy();
		show_debug_message(other.collidedEnems);
	}
	
	for (var i = 0; i < array_length(collidedEnems); i++;) {
		var e = collidedEnems[i];
		var dist = point_distance(e.x,e.y,x,y);
		array_push(collidedEnemPositions,dist);
	}
	
	
	/*with (enemy_parent) {
		if (place_meeting(x,y,o_enem_checker)) array_push(other.collidedEnems,id);
	}*/
	if (array_length(collidedEnems) > 0) nextEnem = collidedEnems[0];
}

function hit_enemy(enemyInst) {
	//freeze_frame_manager.freeze(20);
	//array_push(collidedEnems,enemyInst);
	
	particle_effect(enemyInst.x,enemyInst.y,o_line_part,7,50,c_white,0.2,true);
	//frozenX = x;
	//frozenY = y;
	hitEnem = true;
	enemColInd++;
	if (enemColInd < array_length(collidedEnems)) {
		nextEnem = collidedEnems[enemColInd];
	} else {
		nextEnem = noone;
	}
	
	if (global.playerArmor > 0) lose_armor() else lose_hp();
}

function lose_armor() {
	global.playerArmor--;
}

function lose_hp() {
	global.playerHp--;
}