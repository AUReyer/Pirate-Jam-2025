// resize grid
var g = dGrid;
var instNum = instance_number(depth_parent);
ds_grid_resize(g,2,instNum);

// add instance info to grid
var yy = 0; 
with (depth_parent) {
	g[# 0, yy] = id;
	g[# 1, yy] = depthCoord;
	
	yy++;
}


// sort grid
ds_grid_sort(g,1,true);

//loop through and draw instances
var inst;
yy = 0; repeat(instNum) {
	// get id
	inst = g[# 0, yy];
	// draw instance
	with (inst) {
		event_perform(ev_draw,0);
	}
	yy++;
}
