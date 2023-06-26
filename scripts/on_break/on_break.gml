/// @description on_break(item,x,y,code)
/// @param item
/// @param x
/// @param y
/// @param code
function on_break(argument0, argument1, argument2, argument3) {
	__item = argument0;
	__posX = argument1;
	__posY = argument2;
	__code = argument3;

	on_level(25);
	gms_ini_player_write("status","blocks_broken",real(
	gms_ini_player_read("status","blocks_broken")) + 1);

	if (__item = obj_block_qq){
	   count = inventory_item_get("obj_block_qq");
	   inventory_item_set("obj_block_qq",count + 1);
	}

	if (__item = obj_block_qw){
	   count = inventory_item_get("obj_block_qw");
	   inventory_item_set("obj_block_qw",count + 1);
	}

	if (__item = obj_block_qe){
	   count = inventory_item_get("obj_block_qe");
	   inventory_item_set("obj_block_qe",count + 1);
	}

	if (__item = obj_block_qr){
	   count = inventory_item_get("obj_block_qr");
	   inventory_item_set("obj_block_qr",count + 1);
	}

	if (__item = obj_block_qj){
	   count = inventory_item_get("obj_block_qj");
	   inventory_item_set("obj_block_qj",count + 1);
	   gms_p2p_send(4,gms_p2p_all_in_session,"");
	   gms_p2p_send(5,gms_p2p_all_in_session,"The `2Planet lock `1was removed!");
	   obj_world.planet_owner = "";
	}

	if (__item = obj_block_qk){
	   gms_ini_game_delete("sign_text",global.planet_name+__code);
	}

	if (__item = obj_block_qc){
	   count = inventory_item_get("obj_block_qc");
	   inventory_item_set("obj_block_qc",count + 1);
	   gms_p2p_send(4,gms_p2p_all_in_session,"");
	   gms_p2p_send(5,gms_p2p_all_in_session,"The `2Ruby lock `1was removed!");
	   obj_world.planet_owner = "";
	}

	if (__item = obj_block_wr){
	   count = inventory_item_get("obj_block_wr");
	   inventory_item_set("obj_block_wr",count + 1);
	   gms_p2p_send(4,gms_p2p_all_in_session,"");
	   gms_p2p_send(5,gms_p2p_all_in_session,"The `2Crystal lock `1was removed!");
	   obj_world.planet_owner = "";
	}

	if (__item = obj_block_wp){
	   count = inventory_item_get("obj_block_wp");
	   inventory_item_set("obj_block_wp",count + 1);
	}


	if (__item = obj_wall_q){
	   count = inventory_item_get("obj_wall_q");
	   inventory_item_set("obj_wall_q",count + 1);
	}

	if (__item = obj_wall_w){
	   count = inventory_item_get("obj_wall_w");
	   inventory_item_set("obj_wall_w",count + 1);
	}

	if (__item = obj_wall_e){
	   count = inventory_item_get("obj_wall_e");
	   inventory_item_set("obj_wall_e",count + 1);
	}



}
