/// @description safe_ini_player_write(section,key,value)
/// @param section
/// @param key
/// @param value
function safe_ini_player_write(argument0, argument1, argument2) {
	__string = string(argument2);
	gms_ini_player_write(argument0,argument1,__string);
	__token = string(irandom_range(100,999));
	__string = __token+"_"+__string;
	gms_ini_player_write("safe_"+argument0,argument1,__string);



}
