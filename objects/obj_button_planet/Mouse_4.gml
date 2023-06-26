/// @description Button action
if (string_length(obj_textbox_planet.text) < 1){
 show_notification(spr_block_qj,"Please fill planet name textbox");
 return false;
}
if (gms_ini_game_exists("planet_bdb_index",string_upper(obj_textbox_planet.text))){
planet_enter(obj_textbox_planet.text);
}
if !(gms_ini_game_exists("planet_bdb_index",string_upper(obj_textbox_planet.text))){
planet_create(obj_textbox_planet.text);
}

