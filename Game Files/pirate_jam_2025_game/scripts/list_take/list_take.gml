function list_take_random(list){
	var index = irandom(array_length(list)-1);
	var takenItem = list[index];
	array_delete(list,index,1);
	return takenItem;
}