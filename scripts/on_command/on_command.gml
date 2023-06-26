/// @description on_command(text)
/// @param text
function on_command(argument0) {
	command_text = argument0;
	was_used = 0;

	if (string_copy(command_text,1,5) = "/help" and was_used = 0){
	   chat_add("`1Available commands are `6/kick`1, `6/access`1, `6/trade`1, `6/friend`1, `6/pull`1, `6/pm`1, `6/gm`1, `6/help`1, `6/leave`1.");
	   was_used = 1;
	}

	if (string_copy(command_text,1,6) = "/leave" and was_used = 0){
	   planet_leave();
	   was_used = 1;
	}

	if (string_copy(command_text,1,10) = "/banplanet" and was_used = 0){
	   if (gms_self_admin_rights()){
	      if !(instance_exists(obj_other_player)){
	         gms_ini_game_delete("bdb_planet_index",string(obj_world.planet_index));
	         gms_ini_game_delete("planet_bdb_index",string(global.planet_name));
	         gms_ini_game_delete("planet_owner",string(global.planet_name));
	         planet_leave();
	         show_notification(spr_warning,"Planet was banned");
	      }
	      if (instance_exists(obj_other_player)){
	         chat_add("There are other players, can't ban the planet.");
	      }
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,5) = "/ban " and was_used = 0){
	   if (gms_self_admin_rights()){
	      command_text = string_copy(command_text,6,string_length(command_text));
	      user = string_copy(command_text,1,string_pos(" ",command_text)-1);
	      time = string_copy(command_text,string_pos(" ",command_text)+1,string_length(command_text));
	      gms_ini_game_write("banned_users",string_lower(user),gms_time() + real(time));
	      message = "Player `2"+user+"`1 was `4banned `1for `2"+time+" `1seconds for breaking the game rules!";
	      gms_p2p_send(3,gms_p2p_all_in_game,message);
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,4) = "/pm " and was_used = 0){
	   command_text = string_copy(command_text,5,string_length(command_text));
	   receiver = string_copy(command_text,1,string_pos(" ",command_text)-1);
	   text = string_copy(command_text,string_pos(" ",command_text)+1,string_length(command_text));
	   chat_add("Sending message to `2"+receiver+"`1...");
	   message = "`9**`1Private message from `2"+gms_self_name()+"`9**`1: "+text;
	   gms_p2p_send(6,gms_p2p_all_in_game,receiver,message);
	   obj_server.receiver = receiver;
	   obj_server.alarm[1] = 60;
	   was_used = 1;
	}

	if (string_copy(command_text,1,3) = "/pm" and was_used = 0){
	   chat_add("Use something like `6/pm Player Hi, how are you? `1to send a private message to someone!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,4) = "/gm " and was_used = 0){
	   command_text = string_copy(command_text,5,string_length(command_text));
	   message = "`9**`1Global message from `2"+gms_self_name()+"`9**`1: "+command_text;
	   gms_p2p_send(3,gms_p2p_all_in_game,message);
	   was_used = 1;
	}

	if (string_copy(command_text,1,4) = "/gm" and was_used = 0){
	   chat_add("Use something like `6/gm Please come to my planet! `1to send a message to everyone in all planets!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,6) = "/name " and was_used = 0){
	   if (gms_self_admin_rights()){
	      obj_player.username = string_copy(command_text,7,10);
	      global.__name = obj_player.username;
	      chat_add("`1Your username was changed to `2"+obj_player.username+" `1successfully.");
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,4) = "/inv" and was_used = 0){
	   if (gms_self_admin_rights()){
	      if (obj_player.invisible = false and was_used = 0){
	         obj_player.invisible = true;
	         chat_add("Invisibility mod was `2enabled`1.");
	         was_used = 1;
	      }
	      if (obj_player.invisible = true and was_used = 0){
	         obj_player.invisible = false;
	         chat_add("Invisibility mod was `4disabled`1.");
	         was_used = 1;
	      }
	   }
	}

	if (string_copy(command_text,1,6) = "/pull " and was_used = 0){
	   if !(global.access = 0){
	      command_text = string_copy(command_text,7,string_length(command_text));
	      chat_add("Pulling player `2"+command_text+"`1...");
	      gms_p2p_send(8,gms_p2p_all_in_session,gms_self_name(),command_text,obj_player.x,obj_player.y);
	      was_used = 1;
	   }
	   if (global.access = 0){
	      chat_add("Sorry, only players with access can use this command!");
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,5) = "/pull" and was_used = 0){
	   chat_add("Use something like `6/pull Player `1to pull a player that is in this planet!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,6) = "/kick " and was_used = 0){
	   if !(global.access = 0){
	      command_text = string_copy(command_text,7,string_length(command_text));
	      chat_add("Kicking out player `2"+command_text+"`1...");
	      gms_p2p_send(22,gms_p2p_all_in_session,gms_self_name(),command_text);
	      was_used = 1;
	   }
	   if (global.access = 0){
	      chat_add("Sorry, only players with access can use this command!");
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,5) = "/kick" and was_used = 0){
	   chat_add("Use something like `6/kick Player `1to kick someone out of this planet!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,7) = "/online" and was_used = 0){
	   gms_p2p_send(9,gms_p2p_all_in_game);
	   was_used = 1;
	}

	if (string_copy(command_text,1,7) = "/trade " and was_used = 0){
	   command_text = string_copy(command_text,8,string_length(command_text));
	   gms_p2p_send(11,gms_p2p_all_in_session,command_text);
	   was_used = 1;
	}

	if (string_copy(command_text,1,6) = "/trade" and was_used = 0){
	   chat_add("Use something like `6/trade Player `1to start trading with another player!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,8) = "/friend " and was_used = 0){
	   command_text = string_copy(command_text,9,string_length(command_text));
	   if !(string_lower(global.friend) = string_lower(command_text)){
	      chat_add("Sending friend request to `2"+command_text+"`1...");
	      gms_p2p_send(15,gms_p2p_all_in_session,command_text,gms_self_name());
	   }
	   if (string_lower(global.friend) = string_lower(command_text)){
	      gms_p2p_send(16,gms_p2p_all_in_session,command_text,gms_self_name());
	      global.friend = "";
	   }
	   was_used = 1;
	}

	if (string_copy(command_text,1,7) = "/friend" and was_used = 0){
	   chat_add("Use something like `6/friend Player `1to add someone as friend!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,8) = "/access " and was_used = 0){
	   if (global.access = 1 or gms_self_admin_rights()){
	      command_text = string_copy(command_text,9,string_length(command_text));
	      gms_p2p_send(20,gms_p2p_all_in_session,command_text);
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,7) = "/access" and was_used = 0){
	   chat_add("Use something like `6/access Player `1to give someone temporary build access!");
	   was_used = 1;
	}

	if (string_copy(command_text,1,6) = "/warn " and was_used = 0){
	   if (gms_self_admin_rights()){
	      command_text = string_copy(command_text,7,string_length(command_text));
	      receiver = string_copy(command_text,1,string_pos(" ",command_text)-1);
	      text = string_copy(command_text,string_pos(" ",command_text)+1,string_length(command_text));
	      chat_add("Sending warning to `2"+receiver+"`1...");
	      gms_p2p_send(21,gms_p2p_all_in_game,receiver,text);
	      was_used = 1;
	   }
	}

	if (string_copy(command_text,1,8) = "/restart" and was_used = 0){
	   if (gms_self_admin_rights()){
	      gms_p2p_send(23,gms_p2p_all_in_game);
	   }
	}

	if (was_used = 0){
	   chat_add("`1Unknown chat command, type `6/help `1to see all available commands!");
	}



}
