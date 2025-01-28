function get_index(list, item){
	var count = 0;
	repeat(array_length(list)) {
		if (list[count] == item) return count;
		count++;
	}
}