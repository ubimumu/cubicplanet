/// @description safe_ini_player_delete(section,key)
/// @param section
/// @param key
function safe_ini_player_delete(argument0, argument1) {
	gms_ini_player_delete(argument0,argument1);
	gms_ini_player_delete("safe_"+argument0,argument1);



}
