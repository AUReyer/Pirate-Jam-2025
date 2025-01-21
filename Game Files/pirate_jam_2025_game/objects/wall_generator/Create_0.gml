// generate walls
var hWalls = grid_w/grid_cell_size;
var vWalls = room_height/grid_cell_size;
var wallTotal = hWalls*vWalls;
//var xx = 0;
//var yy = 0;

for (var i = 0; i < vWalls; i++;) {
	for (var j = 0; j < hWalls; j++;) {
		var xx = j*grid_cell_size;
		var yy = i*grid_cell_size;
		with (create(xx,yy,o_wall)) {
			if (i == 0 or i == vWalls-1 or j == 0 or j == hWalls-1) edgeWall = true;
		}
	}
}

// carve out caverns
var destructTrgt = random_range(0.5,0.5)*wallTotal;

while (instance_number(o_wall) > destructTrgt) {
	var xx = random_range(0,grid_w);
	var yy = random_range(0,room_height);
	
	var colList = ds_list_create();
	var rad = random_range(30,100);
	var col = collision_circle_list(xx,yy,rad,o_wall,false,false,colList,false);
	create(xx,yy,o_explosion_point);
	for (var i = 0; i < ds_list_size(colList); i++;) {
		var wall = colList[| i];
		if (!wall.edgeWall) instance_destroy(wall);
	}
	ds_list_destroy(colList);
}
 
// create paths between caverns
with (o_explosion_point) {
	var checkX = x;
	var checkY = y;
	//x = -100000;
	//y = -100000;
	var trgt = instance_furthest(checkX,checkY,o_explosion_point);
	var dist = point_distance(checkX,checkY,trgt.x,trgt.y);
	var dir = point_direction(checkX,checkY,trgt.x,trgt.y);
	
	/*with (create(checkX,checkY,o_path_line)) {
		image_xscale = dist;
		image_angle = dir;
	}*/
	
	x = checkX;
	y = checkY;
	var l = ds_list_create();
	var cLine = collision_line_list(x,y,trgt.x,trgt.y,o_wall,false,false,l,false);
	for (var i = 0; i < ds_list_size(l); i++;) {
		var wall = l[| i];
		if (!wall.edgeWall) instance_destroy(wall);
	}
	ds_list_destroy(l);
}

with (o_explosion_point) instance_destroy();