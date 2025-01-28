function split_string(text, delimiter, numbers) {
	var t = text;
	var d = delimiter;
	var len = string_length(t);
	var itemBase = 1;
	var char = 1;
	var count = 1;
	var list = [];
	var currentStr = "";
	
	repeat(len) {
		if (string_char_at(t,char) != d) {
			currentStr = string_copy(t,itemBase,count);
			char++;
			count++;
		} else {
			currentStr = string_delete(currentStr,count,1);
			if (!numbers) array_push(list,currentStr) else array_push(list,real(currentStr));
			currentStr = "";
			itemBase = char+1;
			count = 1;
			char++;
		}

	}
	return list;
}