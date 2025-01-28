// makes a list from base to size
function listify(base,size){
	var list = [];
	repeat(size) {
		array_push(list,base);
		base++;
		if (base >= size) break;
	}
	return list;
}