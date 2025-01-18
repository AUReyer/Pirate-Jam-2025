function mouse_over_gui(obj = self){
	var wCoef = window_get_width()/view_w;
	var hCoef = window_get_height()/view_h;
	if (position_meeting(window_mouse_get_x()/wCoef,window_mouse_get_y()/hCoef,obj)) return true else return false;
}