function random_list(itemList){
	var newList = [];
	var size = array_length(itemList);
	
	repeat(size) {
		var ind = irandom(array_length(itemList)-1);
		array_push(newList,itemList[ind]);
		array_delete(itemList,ind,1);
	}
	return newList;
}