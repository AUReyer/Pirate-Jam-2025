var rowLen = grid_w/grid_cell_size;
var colLen = room_height/grid_cell_size;

var tileId = 0;
for (var i = 0; i < colLen; i++;) {
	for (var j = 0; j < rowLen; j++;) {
		var xx = j*grid_cell_size;
		var yy = i*grid_cell_size;
		with (create(xx,yy,o_grid_cell)) {
			image_xscale = grid_cell_size/sprite_width;
			image_yscale = grid_cell_size/sprite_height;
			gridCellId = tileId;
		}
		tileId++;
	}
}