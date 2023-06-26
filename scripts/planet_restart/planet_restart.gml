/// @description planet_restart()
function planet_restart() {
	obj_player.player_health = 30;
	if !(obj_world.checkpoint = ""){
	   obj_player.target_x = obj_world.checkpoint_x;
	   obj_player.target_y = obj_world.checkpoint_y;
	   __view_set( e__VW.WView, 0, 1408 );
	   __view_set( e__VW.HView, 0, 800 );
	   return false;
	}
	if (instance_exists(obj_block_qq)){
	   obj_player.target_x = obj_block_qq.x;
	   obj_player.target_y = obj_block_qq.y;
	   __view_set( e__VW.WView, 0, 1408 );
	   __view_set( e__VW.HView, 0, 800 );
	}
	if !(instance_exists(obj_block_qq)){
	   obj_player.target_x = irandom(1504);
	   obj_player.target_y = irandom(992);
	   __view_set( e__VW.WView, 0, 1408 );
	   __view_set( e__VW.HView, 0, 800 );
	}



}
