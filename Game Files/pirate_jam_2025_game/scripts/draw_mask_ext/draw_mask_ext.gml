function draw_mask_ext(col,alpha,sprite,xScale,yScale,xx,yy,angl,img) {
	gpu_set_fog(true,col,0,0);
	draw_sprite_ext(sprite,img,xx,yy,xScale,yScale,angl,c_white,alpha);
	gpu_set_fog(false,c_white,0,0);
}