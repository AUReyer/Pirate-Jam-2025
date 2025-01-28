function list_copy(list){
	var newL = [];
	var count = 0;
	repeat(array_length(list)) {
		array_push(newL,list[count]);
		count++;
	}
	return newL;
}