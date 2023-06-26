/// @description Show info
if (gms_ini_game_exists("planet_owner",global.planet_name)){
   planet_owner = gms_ini_game_read("planet_owner",global.planet_name);
   gms_ini_game_delete("planet_owner",global.planet_name);
   chat_add("`6Found old owner in previous database, backuping...");
   alarm[0] = 5;
}

was_used = 0;
if (planet_owner = "" and was_used = 0){
   chat_add("Entered planet `2"+global.planet_name+"`1, planet is not owned by anyone, `2access received`1.");
   was_used = 1;
}
if (string(planet_owner) = string(gms_self_playerid()) and was_used = 0){
   planet_owner_name = gms_ini_game_read("player_username",string(planet_owner));
   chat_add("Entered planet `2"+global.planet_name+"`1, planet is owned by `2"+planet_owner_name+"`1, `2access received`1.");
   was_used = 1;
}

if (was_used = 0){
   planet_owner_name = gms_ini_game_read("player_username",string(planet_owner));
   chat_add("Entered planet `2"+global.planet_name+"`1, planet is owned by `2"+planet_owner_name+"`1, `4no access`1.");
}

