function list_item_delete(list,item){
	var index = 0;
	repeat (array_length(list)) {
		if (list[index] == item) {
			array_delete(list,index,1);
			return;
		}
		index++;
	}
}