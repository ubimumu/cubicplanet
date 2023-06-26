/// @description on_planet_load(handle)
/// @param handle
function on_planet_load(argument0) {
	var handle = argument0;
	if (gms_bdb_size(handle) < 32){
	   gms_bdb_close(handle);
	   on_planet_loaded();
	   return false;
	}
	gms_bdb_seek(handle,0);

	obj_world.planet_owner = gms_bdb_read(handle,bdb_string);
	none = gms_bdb_read(handle,bdb_string);
	none = gms_bdb_read(handle,bdb_string);
	none = gms_bdb_read(handle,bdb_string);
	none = gms_bdb_read(handle,bdb_string);

	//Blocks layer
	position_p = 0;
	repeat(32)
	{
	   blocks_load(position_p,gms_bdb_read(handle, bdb_string));
	   position_p += 32;
	}
   
	//Walls layer
	position_p = 0;
	repeat(32)
	{
	   walls_load(position_p,gms_bdb_read(handle, bdb_string));
	   position_p += 32;
	} 


	gms_bdb_close(handle);

	on_planet_loaded();



}
