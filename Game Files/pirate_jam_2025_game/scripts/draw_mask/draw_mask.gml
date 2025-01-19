function draw_mask(col,alpha){
	gpu_set_fog(true,col,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,alpha);
	gpu_set_fog(false,c_white,0,0);
}