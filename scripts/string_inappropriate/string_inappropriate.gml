/// @description string_inappropriate(string)
/// @param string
function string_inappropriate(argument0) {
	argument0 = string_lower(argument0);

	if (string_pos("fuck",argument0)){return true}
	if (string_pos("shit",argument0)){return true}
	if (string_pos("cunt",argument0)){return true}
	if (string_pos("faggot",argument0)){return true}
	if (string_pos("pussy",argument0)){return true}
	if (string_pos("dick",argument0)){return true}
	if (string_pos("kontol",argument0)){return true}
	if (string_pos("memek",argument0)){return true}

	return false;



}
