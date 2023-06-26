/// @description Variables
name = "ghost";
locked = true;

if (safe_ini_player_read_real("status","level") > 99){
   locked = false;
}

if (gms_self_admin_rights()){
   locked = false;
}

