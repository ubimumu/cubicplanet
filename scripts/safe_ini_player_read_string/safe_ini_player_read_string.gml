/// @description safe_ini_player_read_string(section,key)
/// @param section
/// @param key
function safe_ini_player_read_string(argument0, argument1) {
	if (gms_ini_player_exists("safe_"+argument0,argument1)){
	   __string = gms_ini_player_read("safe_"+argument0,argument1);
	   __string = string_copy(__string,5,string_length(__string));
	   return string(__string);
	}

	__string = gms_ini_player_read(argument0,argument1);
	return string(__string);



}
