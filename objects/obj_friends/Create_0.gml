friends = ds_map_create();
numbers = ds_map_create();
status = ds_map_create();

current = 1;

repeat(25){
   player_id = gms_ini_player_read("friends",string(current));
   name = gms_ini_game_read("player_username",string(player_id));
   friends[? string(current)] = name;
   numbers[? string(name)] = string(current);
   if !(name = ""){status[? string(current)] = "`4Offline";} 
   if (name = ""){status[? string(current)] = "";}
   current += 1;
}

gms_p2p_send(18,gms_p2p_all_in_game);
alarm[0] = 200;

