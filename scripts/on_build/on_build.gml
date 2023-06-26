/// @description on_build(id)
/// @param id
function on_build(argument0) {
	on_level(25);
	gms_ini_player_write("status","blocks_placed",real(
	gms_ini_player_read("status","blocks_placed")) + 1);

	if (argument0 = "obj_block_qj"){
	   gms_p2p_send(5,gms_p2p_all_in_session,"Planet was locked by "+gms_self_name());
	   gms_p2p_send(4,gms_p2p_all_in_session,string(gms_self_playerid()));
	   obj_world.planet_owner = string(gms_self_playerid());
	}

	if (argument0 = "obj_block_qc"){
	   gms_p2p_send(5,gms_p2p_all_in_session,"Planet was locked by "+gms_self_name());
	   gms_p2p_send(4,gms_p2p_all_in_session,string(gms_self_playerid()));
	   obj_world.planet_owner = string(gms_self_playerid());
	}

	if (argument0 = "obj_block_wr"){
	   gms_p2p_send(5,gms_p2p_all_in_session,"Planet was locked by "+gms_self_name());
	   gms_p2p_send(4,gms_p2p_all_in_game,global.planet_name,string(gms_self_playerid()));
	   obj_world.planet_owner = string(gms_self_playerid());
	}



}
