/// @description on_login(callback)
/// @param callback
function on_login(argument0) {
	if (instance_exists(obj_button_login)){obj_button_login.loading = false}
	switch(argument0)
	{
	  case e_ok:
	  if (gms_ini_game_read("system","version") > global.version){
	     show_notification(spr_warning,"`1Update is required, please update and come back.");
	     return false;
	  }
  
	  if (gms_ini_game_exists("system","maintenance")){
	     if !(gms_self_admin_rights()){
	        show_notification(spr_warning,"Sorry, we are under maintenance!");
	        return false;
	     }
	  }
  
	  global.__name = string_copy(global.__name,4,string_length(global.__name));
	  if !(gms_ini_game_exists("player_username",string(gms_self_playerid()))){
	   gms_ini_game_write("player_username",string(gms_self_playerid()),gms_self_name());
	  }
	  global.__name = gms_ini_game_read("player_username",string(gms_self_playerid()));
  
  
	  check_ban();
	  room = rm_menu;
  
	  show_notification(spr_block_qj,"`1Logged in successfully!");
  
	  if !(safe_ini_player_exists("inventory_item","1")){
	     inventory_item_set("break_tool",1);
	     inventory_item_set("editing_tool",1);
	  }
  
	  if !(safe_ini_player_exists("status","level")){
	     safe_ini_player_write("status","level",1);
	  }
  
	  if !(safe_ini_player_exists("status","gems")){
	     safe_ini_player_write("status","gems",1000);
	  }
  
	  break;
  
	  case e_accountexists:
	  show_notification(spr_block_qj,"`4Oops`1, something went wrong, try again!");
	  break;

	  case e_already_logged_in:
	  show_notification(spr_block_qj,"`4Oops`1, this account is already online!");
	  break;
  
	  case e_banned:
	  show_notification(spr_block_qj,"`4Oops`1, your account is banned!");
	  break;
  
	  case e_global_ban:
	  show_notification(spr_block_qj,"`4Oops`1, your account is banned!");
	  break;
  
	  case e_invalid_name:
	  show_notification(spr_block_qj,"`4Oops`1, account with that name doesn't exist!");
	  break;
  
	  case e_kicked:
	  show_notification(spr_block_qj,"`4Oops`1, try again!");
	  break;
  
	  case e_local_ban:
	  show_notification(spr_block_qj,"`4Oops`1, your account is banned!");
	  break;
  
	  case e_noaccount:
	  show_notification(spr_block_qj,"`4Oops`1, account with that name doesn't exist!");
	  break;
  
	  case e_noconnection:
	  show_notification(spr_block_qj,"`4Oops`1, no internet connection, try again later!");
	  break;
  
	  case e_ping:
	  show_notification(spr_block_qj,"`4Oops`1, no internet connection, try again later!");
	  break;
  
	  case e_serverfull:
	  show_notification(spr_block_qj,"`4Oops`1, too much players are online, come back later!");
	  break;
  
	  case e_userloggedin:
	  show_notification(spr_block_qj,"`4Oops`1, this account is already online!");
	  break;
  
	  case e_wrongpass:
	  show_notification(spr_block_qj,"`4Oops`1, the password you entered is wrong!");
	  break;
	}



}
