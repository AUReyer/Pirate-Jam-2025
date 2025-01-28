event_inherited();
depthCoord = ground_depth+9;
aimedAt = false;
moving = false;
trgtX = 0;
trgtY = 0;
moveSpd = 0.3;
enum enemTypes {
	singleMover,
	NUM
}

myType = enemTypes.singleMover;

function get_valid_move_tiles() {
	var currentTile = instance_position(x,y,o_grid_cell);
	var l = [];
	switch(myType) {
		case enemTypes.singleMover:
			for (var dir = 0; dir < 360; dir+=90;) {
				var checkX = currentTile.x+lengthdir_x(grid_cell_size,dir);
				var checkY = currentTile.y+lengthdir_y(grid_cell_size,dir);
				var t = instance_position(checkX,checkY,o_grid_cell);
				var enem = instance_position(checkX,checkY,enemy_parent);
				var player = instance_place(checkX,checkY,o_player);
				var wall = instance_position(checkX,checkY,wall_parent);
				//show_debug_message(dir);
				
				if (t != noone and enem == noone and wall == noone and player == noone) array_push(l,t);
				
			}
		break;
	}
	
	return l;
}

function start_move() {
	switch(myType) {
		case enemTypes.singleMover:
			var l = get_valid_move_tiles();
			show_debug_message(l);
			if (array_length(l) > 0) {
				var t = list_choose(l);
				moving = true;
				trgtX = t.x+grid_cell_size/2;
				trgtY = t.y+grid_cell_size/2;
			} else {
				state_manager.enemCountdown = true;
			}
		break;
	}
}