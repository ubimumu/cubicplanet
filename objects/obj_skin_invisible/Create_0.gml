/// @description Variables
name = "invisible";
locked = true;

if (safe_ini_player_read_real("status","level") > 49){
   locked = false;
}

