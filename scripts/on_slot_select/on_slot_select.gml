/// @description on_slot_select()
function on_slot_select() {
	__item = obj_inventory.item;

	//Check if not untradeables
	if (__item = "break_tool"){return ""}
	if (__item = "editing_tool"){return ""}

	//Check if not wearing
	if (gms_ini_player_read("wearing","hat") = __item){return ""}
	if (gms_ini_player_read("wearing","face") = __item){return ""}
	if (gms_ini_player_read("wearing","shirt") = __item){return ""}
	if (gms_ini_player_read("wearing","pants") = __item){return ""}
	if (gms_ini_player_read("wearing","hand") = __item){return ""}
	if (gms_ini_player_read("wearing","legs") = __item){return ""}
	if (gms_ini_player_read("wearing","back") = __item){return ""}

	return __item;



}
