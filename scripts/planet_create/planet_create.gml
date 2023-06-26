/// @description planet_create(name)
/// @param name
function planet_create(argument0) {
	planet_name = string_upper(argument0);

	if (string_inappropriate(planet_name)){
	   show_notification(spr_warning,"This planet name is not allowed");
	   return false;
	}

	if (gms_bdb_find_empty() > gms_ini_game_read("system","max_planets")){
	   show_notification(spr_warning,"You are not allowed to create new planets right now to avoid abuse.");
	   return false;
	}

	cooldown = real(gms_ini_player_read("status","planet_create_cooldown"));
	if (cooldown > gms_time()){
	   show_notification(spr_warning,"Please wait `2"+string(cooldown - gms_time())+"`1 seconds before creating another planet!");
	   return false;
	}

	if (gms_ini_game_exists("planet_bdb_index",planet_name)){
	   return false;
	}


	if !(gms_ini_game_exists("planet_bdb_index",planet_name)){

	   planet_index = string(gms_bdb_find_empty());

	   gms_ini_game_write("bdb_planet_index",planet_index,planet_name);
	   gms_ini_game_write("planet_bdb_index",planet_name,planet_index);
	   gms_ini_player_write("player_planets",planet_name,gms_time());

	   gms_ini_player_write("status","planet_create_cooldown",gms_time() + gms_ini_game_read("system","planet_cooldown_time"));

	   gms_bdb_open(real(planet_index),false,on_planet_create);
	}



}
