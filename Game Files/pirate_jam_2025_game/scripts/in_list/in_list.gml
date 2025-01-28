function in_list(list,item){
	var count = 0;
	repeat(array_length(list)) {
		if (list[count] == item) return true;
		count++;
	}
	return false;

}