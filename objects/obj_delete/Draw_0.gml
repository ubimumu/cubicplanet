planet_name = string(gms_ini_game_read("bdb_planet_index",string(viewing)));
if (gms_ini_game_exists("planet_owner",planet_name)){
   gms_ini_game_delete("bdb_planet_index",string(viewing));
   gms_ini_game_delete("planet_bdb_index",string(planet_name));
   gms_ini_game_delete("planet_owner",string(planet_name));
   show_notification(spr_player_head_right,"Auto deleted!");
   viewing += 1;
}

if (keyboard_check_pressed(vk_space)){
   gms_ini_game_delete("bdb_planet_index",string(viewing));
   gms_ini_game_delete("planet_bdb_index",string(planet_name));
   gms_ini_game_delete("planet_owner",string(planet_name));
   show_notification(spr_player_head_right,"Manual deleted!");
   viewing += 1;
}


draw_text(x,y,string_hash_to_newline(planet_name));

draw_text(x,y+64,string_hash_to_newline(string(viewing)));

