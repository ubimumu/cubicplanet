/// @description on_planet_save(handle)
/// @param handle
function on_planet_save(argument0) {
	var handle = argument0;
	if (gms_bdb_size(handle) < 32){
	   chat_add("`4Failed to save planet, using alternate method...");
	   on_planet_save(handle);
	   return false;
	}

	gms_bdb_seek(handle,0);

	gms_bdb_write(handle,bdb_string,obj_world.planet_owner);
	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");

	//Blocks layer
	position_p = 0;
	repeat(32)
	{
	   gms_bdb_write(handle,bdb_string, blocks_save(position_p));
	   position_p += 32;
	}

	//Walls layer
	position_p = 0;
	repeat(32)
	{
	   gms_bdb_write(handle,bdb_string, walls_save(position_p));
	   position_p += 32;
	}

	gms_bdb_close(handle);



}
