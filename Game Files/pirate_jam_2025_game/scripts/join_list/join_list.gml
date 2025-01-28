function join_list(list,delimiter){
	var str = "";
	var ind = 0;
	repeat(array_length(list)) {
		str += (string(list[ind]) + delimiter);
		ind++;
	}
	return str;
}