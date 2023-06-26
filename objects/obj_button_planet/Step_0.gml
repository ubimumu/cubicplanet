/// @description Custom hint
if (gms_ini_game_exists("planet_bdb_index",string_upper(obj_textbox_planet.text))){
hint = "Enter planet";
}
if !(gms_ini_game_exists("planet_bdb_index",string_upper(obj_textbox_planet.text))){
hint = "Create planet";
}

