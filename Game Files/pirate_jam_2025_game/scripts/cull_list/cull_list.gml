function cull_list(list1,list2){
	// goes through list2 and deletes every item in it from list1
	var ind = 0;
	var newL = [];
	repeat(array_length(list1)) {
		var el = list1[ind];
		if (!in_list(list2,el)) array_push(newL, el);
		ind++;
	}
	return newL;
}