/// @description Variables
player_health = 30;
username = gms_self_name();
message = "";
region = os_get_region();
invisible = false;
skin = 2;
dead = false;
level = "";

target_x = x;
target_y = y;

global.weapon_power = 0.25;

grav = 1;
hsp = 0;
vsp = 0;
jumpspeed = 15;
movespeed = 8;

hand_1 = -40;
target_hand_1 = 40;
hand_2 = 40;
target_hand_2 = -40;

leg = 0;
alarm[1] = 5;

facing = 1;

inventory_item_set("planet_key",0);

alarm[3] = 1;

///Load
if (safe_ini_player_read_string("status","skin") = "brown"){skin = 1;}
if (safe_ini_player_read_string("status","skin") = "default"){skin = 2;}
if (safe_ini_player_read_string("status","skin") = "white"){skin = 3;}
if (safe_ini_player_read_string("status","skin") = "invisible"){skin = 4;}
if (safe_ini_player_read_string("status","skin") = "ghost"){skin = 5;}

if (gms_ini_game_exists("system","message")){
   system_message = gms_ini_game_read("system","message");
   chat_add(string(system_message));
}

character_load();

