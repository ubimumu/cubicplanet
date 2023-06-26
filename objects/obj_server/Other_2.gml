/// @description Server and global settings
gms_settings(1, 1, obj_player, obj_other_player);
GoogleMobileAds_Init("ca-app-pub-5281869300652392/9707506852","ca-app-pub-5281869300652392~7678123784");

//Scripts
gms_script_set_p2p(on_p2p);
gms_script_set_kick(on_disconnect);
gms_script_set_connection_lost(on_disconnect);
gms_message_reporting(mt_none);

//Settings
display_set_gui_size(1408,800);
gmkb_init();
gms_debug_hide_errors(); 
gms_debug_enable();

//Global variables
global.username = "";
global.destroy = "";
global.access = 0;
global.weapon_power = 0;
global.planet_name = "<Menu>";
global.version = 32;
global.friend = "";
global.drag = false;

room_goto_next();

