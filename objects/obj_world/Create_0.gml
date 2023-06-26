/// @description Start planet
admin = false;
planet_index = real(gms_ini_game_read("planet_bdb_index",string(global.planet_name)));
planet_owner = "";
global.access = 0;
building = false;
breaking = true;

planet_load(planet_index);

checkpoint_x = 0;
checkpoint_y = 0;
checkpoint = "";

race = false;

