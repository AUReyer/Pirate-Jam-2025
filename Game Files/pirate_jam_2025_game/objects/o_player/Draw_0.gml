if (aiming) {
	var sprSpacing = 4;
	var spacing = sprite_get_width(s_aim_node)+sprSpacing;
	var nodeCount = round(aimLineLen/spacing);
	var nx = x+lengthdir_x(aimRadius,aimDir);
	var ny = y+lengthdir_y(aimRadius,aimDir);
	nodeCount = max(nodeCount,1);
	for (var i = 0; i < nodeCount; i++;) {
		nx+=lengthdir_x(spacing,aimDir);
		ny+=lengthdir_y(spacing,aimDir);
		if (aimNodeSize > 0.1) draw_sprite_ext(s_aim_node,0,nx,ny,aimNodeSize,aimNodeSize,aimDir,c_white,1);
	}
}

draw_sprite_ext(sprite_index,0,x,y,1,1,drawAngle,c_white,1);
draw_text(20,20,anglDif);