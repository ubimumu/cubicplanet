/// @description string_crypt(string)
/// @param string
function string_crypt(argument0) {
	argument0 = string(argument0);
	__pos = string_length(argument0);
	__result = "";
	repeat(string_length(argument0)){
	   __result += string_copy(argument0,__pos,1);
	   __pos -= 1;
	}

	return __result;



}
