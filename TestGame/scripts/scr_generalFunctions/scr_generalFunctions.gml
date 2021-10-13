// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_explode(_delimiter, _string, _forceReal){
	var _output
	if (_string != "") {
		i = 0
		while(1) {
			delimiterPos = string_pos(_delimiter, _string);
			if (_forceReal) {
				if (delimiterPos != 0) {
					_output[i] = real(string_copy(_string, 1, delimiterPos - 1));
					_string = string_copy(_string, delimiterPos + 1, string_length(_string) - 1);
					i++;
				} else {
					_output[array_length(_output)] = real(_string);
					return _output;
					break;
				}
			} else {
				if (delimiterPos != 0) {
					_output[i] = string_copy(_string, 1, delimiterPos - 1);
					_string = string_copy(_string, delimiterPos + 1, string_length(_string) - 1);
					i++;
				} else {
					_output[array_length(_output)] = _string;
					return _output;
					break;
				}
			}
		}
	} else {
		throw("The function scr_explode received an empty string, which can't be split");
	}
}