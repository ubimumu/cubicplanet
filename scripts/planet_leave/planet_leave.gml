/// @description planet_leave()
function planet_leave() {
	gms_p2p_send(3,gms_p2p_all_in_session,"`2"+gms_self_name()+" `1has left the planet!");
	global.planet_name = "<Menu>";
	gms_session_create_ext(0,"<Menu>");
	chat_add("Leaving planet...");
	room = rm_menu;



}
