/// @description planet_enter(name)
/// @param name
function planet_enter(argument0) {
	global.planet_name = string_upper(argument0);

	if !(gms_ini_game_exists("planet_bdb_index",global.planet_name)){
	chat_add("`4Oops`1, this planet does not exist!");
	return false;
	}

	if (gms_ini_game_exists("planet_suspended",global.planet_name)){
	chat_add("`4OOps`1, this plannet is suspended for breaking the game rules!");
	return false;
	}

	session = session_by_tag(global.planet_name);

	if !(session < 0){
	gms_session_join(session);
	room = rm_play;
	}

	if (session < 0){
	gms_session_create_ext(1,global.planet_name);
	room = rm_play;
	}



}
