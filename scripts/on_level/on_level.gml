/// @description on_level(max)
/// @param max
function on_level(argument0) {
	safe_ini_player_write("status","xp",safe_ini_player_read_real("status","xp") + irandom(argument0));

	if (safe_ini_player_read_real("status","level") * 100 < safe_ini_player_read_real("status","xp")){
	   safe_ini_player_write("status","level",safe_ini_player_read_real("status","level") + 1);
	   chat_add(gms_self_name()+" `1has reached level `2"+safe_ini_player_read_string("status","level")+"`1!");
	   safe_ini_player_write("status","xp",0);
	}



}
