// keyboard_check_pressed
function k(key){
	if (is_string(key)) {
		key = ord(key);
	}
	return (keyboard_check_pressed(key));
}