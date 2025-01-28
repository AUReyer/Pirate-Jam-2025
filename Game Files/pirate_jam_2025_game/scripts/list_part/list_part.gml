function list_part(list,base,indices){
	var newL = [];
	repeat(indices) {
		array_push(list[base]);
		base++;
	}
	return newL;
}