/// @description planet_random()
function planet_random() {
	random_planet = gms_bdb_find_empty() - 1;
	random_planet = string(irandom(random_planet));
	return gms_ini_game_read("bdb_planet_index",random_planet);



}
