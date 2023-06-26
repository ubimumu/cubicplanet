/// @description on_planet_loaded()
function on_planet_loaded() {
	if (instance_exists(obj_block_qq)){
	   instance_create(obj_block_qq.x,obj_block_qq.y,obj_player);
	}
	if !(instance_exists(obj_block_qq)){
	   instance_create(irandom(1504),irandom(992),obj_player);
	}

	gms_p2p_send(3,gms_p2p_all_in_session,"`2"+gms_self_name()+"`1 has entered the planet!");

	obj_world.alarm[1] = 1;



}
