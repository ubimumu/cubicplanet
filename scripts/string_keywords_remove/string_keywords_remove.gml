/// @description string_keywords_remove(string)
/// @param string
function string_keywords_remove(argument0) {
	_str = string(argument0);

	//[Keywords] {

	_str = string_replace_all(_str,"`1",""); //White
	_str = string_replace_all(_str,"`2",""); //Green
	_str = string_replace_all(_str,"`3",""); //Aqua
	_str = string_replace_all(_str,"`4",""); //Red
	_str = string_replace_all(_str,"`5",""); //Yellow
	_str = string_replace_all(_str,"`6",""); //Orange
	_str = string_replace_all(_str,"`7",""); //Black
	_str = string_replace_all(_str,"`8",""); //Purple
	_str = string_replace_all(_str,"`9",""); //Silver
	_str = string_replace_all(_str,"`0",""); //Yellow

	_str = string_replace_all(_str,"`",""); //Starter
	//[Keywords] }

	return string(_str); //Return modfied string for drawing



}
