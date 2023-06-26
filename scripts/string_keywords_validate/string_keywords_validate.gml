/// @description string_keywords_validate(string)
/// @param string
function string_keywords_validate(argument0) {
	_str = string(argument0);

	//[Keywords] {

	_str = string_replace_all(_str,"`1","[$=16777215]"); //White
	_str = string_replace_all(_str,"`2","[$=60000]"); //Green
	_str = string_replace_all(_str,"`3","[$=16751680]"); //Aqua
	_str = string_replace_all(_str,"`4","[$=200]"); //Red
	_str = string_replace_all(_str,"`5","[$=70000]"); //Yellow
	_str = string_replace_all(_str,"`6","[$=4235519]"); //Orange
	_str = string_replace_all(_str,"`7","[$=0]"); //Black
	_str = string_replace_all(_str,"`8","[$=8388736]"); //Purple
	_str = string_replace_all(_str,"`9","[$=12632256]"); //Silver
	_str = string_replace_all(_str,"`0","[$=65535]"); //Yellow

	_str = string_replace_all(_str,"`",""); //Starter
	//[Keywords] }

	return string(_str); //Return modfied string for drawing



}
