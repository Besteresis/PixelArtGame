 /// @description Textbox test

var _text;

//Get all dialogue file names to load
var _file
var _newFile
if (directory_exists("dialogue")) {
	_file[0] = file_find_first("dialogue/*.txt", fa_readonly);
	i = 1;
	while(1) {
		show_debug_message(_file);
		_newFile = file_find_next();
		if (_newFile == "") {
			_file[i] = _newFile;
			i += 1;
		} else {
			break;
		}
	}
}
show_debug_message(_file);

// Create a textbox if NPC is nearby
if (nearbyNPC && global.playerControl) {
	_text = nearbyNPC.myText;
	if (!instance_exists(obj_textbox)) {
		iii = instance_create_depth(x, y, -10000, obj_textbox);	
		iii.textToShow = _text;
	}
}