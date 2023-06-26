/// @description planet_save(index)
/// @param index
function planet_save(argument0) {
	index = argument0;
	gms_bdb_open(index,true,on_planet_save);



}
