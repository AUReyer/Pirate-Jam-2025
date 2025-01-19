function particle_effect(x,y,particle,number,offset,color,offsetAmt=0.1,directional=false,direc1 = 0,direc2 = 360,evenSpacing = false) {
	var dir = 0;
	if (evenSpacing) {
		var secLen = 360/number;
		dir = random(360);
	}
	repeat(number) {
		if (!evenSpacing) dir = random_range(direc1,direc2) else dir+=secLen*random_range(0.9,1.1);
		var len = offset+random_range(-offset*offsetAmt,offset*offsetAmt);
		var xx = x + lengthdir_x(len,dir);
		var yy = y + lengthdir_y(len,dir);
		with (create(xx,yy,particle)) {
			image_blend = color;
			direction = dir;
			if (directional) image_angle = dir else image_angle = random(360);
		}
	}
}