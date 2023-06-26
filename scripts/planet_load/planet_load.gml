/// @description planet_load(index)
/// @param index
function planet_load(argument0) {
	index = argument0;
	gms_bdb_open(index,true,on_planet_load);



}
