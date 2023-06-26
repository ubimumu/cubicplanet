/// @description check_ban()
function check_ban() {
	bantime = gms_ini_game_read("banned_users",string_lower(gms_self_name()));
	if (bantime > gms_time()){
	  show_notification(spr_warning,"Your account is banned for `2"+string(bantime - gms_time())+" `1seconds.");
	  room = rm_login;
	  return false;
	}



}
