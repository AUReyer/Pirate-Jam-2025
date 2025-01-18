function clicked_on_gui(button,obj = self) {
	if (mouse_over_gui(obj) and click(button)) return true else return false;
}