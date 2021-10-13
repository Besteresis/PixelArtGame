 /// @description Get own dialogue

var _rules
dialogueProgression = 0;
// Load own dialogue file
if (directory_exists("dialogue")) {
	try {
		fileName = file_find_first("dialogue/" + object_get_name(object_index) + ".txt", 0);
		show_debug_message(fileName + " was found");
	} catch(_exception) {
		show_debug_message("There is no dialogue file for " + object_get_name(object_index));	
	}
}
//Load all dialogue files and it's content

file = file_text_open_read("dialogue/" + object_get_name(object_index) + ".txt")
_rules = file_text_read_string(file)
file_text_readln(file)
dialogueRules = scr_explode(",", _rules, 1);
i = 0
while (!file_text_eof(file)) {
	dialogueText[i] = file_text_read_string(file);
	file_text_readln(file)
	i++;
} 
file_text_close(file); 
show_debug_message(dialogueRules);
show_debug_message(dialogueText);
