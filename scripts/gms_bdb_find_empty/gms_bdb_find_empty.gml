/// @description gms_bdb_find_empty()
function gms_bdb_find_empty() {
	current = 0;
	repeat(4096)
	{
	  if !(gms_ini_game_exists("bdb_planet_index",string(current))){
	  return current;
	  }
	  current += 1
	}

	return -1;



}
