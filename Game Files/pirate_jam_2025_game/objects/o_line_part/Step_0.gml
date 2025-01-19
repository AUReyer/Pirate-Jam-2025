time++;

if (time == lifeSpan) shrinkSpd*=20;

image_xscale = lerp(image_xscale,0,shrinkSpd);
image_yscale = lerp(image_yscale,0,shrinkSpd*0.7);
if (abs(image_xscale) <= 0.2) instance_destroy();


imgTime++;
if (imgTime == imgSpd) {
	imgTime = 0;
	img++;
	if (img == 2) img = 0;
}

speed = lerp(speed,0,0.2);