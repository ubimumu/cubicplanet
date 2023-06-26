/// @description on_p2p(message_id,sender_id,arguments)
/// @param message_id
/// @param sender_id
/// @param arguments
function on_p2p(argument0, argument1, argument2) {
	message_id = argument0;
	sender_id = argument1;
	arguments = argument2;

	obj_server.alarm[2] = 10; //Call event spawner

	if (message_id = 1) { //Block builded
	   if (instance_exists(obj_world)){
	      posX = real(ds_list_find_value(arguments,0));
	      posY = real(ds_list_find_value(arguments,1));
	      obj = ds_list_find_value(arguments,2);
	      if (place_free(posX,posY)){
	      instance_create(posX,posY,obj);
	      sound_play(snd_block_place);
	      }
	   }
	}

	if (message_id = 2) { //Block broken
	   if (instance_exists(obj_world)){
	      global.destroy = string(ds_list_find_value(arguments,0));
	      sound_play(snd_block_destroy);
	      obj_server.alarm[0] = 3;
	   }
	}

	if (message_id = 3) { //Default chat message received
	   sender_text = string(ds_list_find_value(arguments,0));
	   chat_add(sender_text);
	   check_ban();
	}

	if (message_id = 4) { //Owner changes
	   if (instance_exists(obj_world)){
	      planet_owner = string(ds_list_find_value(arguments,0));
	      obj_world.planet_owner = planet_owner;
	      obj_world.alarm[0] = 5;
	   }
	}

	if (message_id = 5) { //Notification received
	   text = string(ds_list_find_value(arguments,0));
	   show_notification(spr_warning,text);
	}

	if (message_id = 6) { //Private message received
	   receiver = string(ds_list_find_value(arguments,0));
	   text = string(ds_list_find_value(arguments,1));
	   if (string_lower(receiver) = string_lower(string_keywords_remove(gms_self_name()))){
	      chat_add(text);
	      gms_p2p_send(7,sender_id,gms_self_name());
	      if (gms_self_admin_rights()){
	      gms_p2p_send(3,sender_id,"`4Please note that moderators can't give back stolen items or planets.");
	      }
	   }
	}

	if (message_id = 7) { //Private message sent
	   receiver = string(ds_list_find_value(arguments,0));
	   chat_add("Private message has been successfully sent to `2"+receiver+"`1!");
	   obj_server.alarm[1] = -1;
	}

	if (message_id = 8) { //Pull
	   if (sender_id = gms_self_playerid()){return false}
	   puller = string(ds_list_find_value(arguments,0));
	   topull = string(ds_list_find_value(arguments,1));
	   if (string_lower(topull) = string_lower(string_keywords_remove(gms_self_name()))){
	      if (instance_exists(obj_player)){
	         gms_p2p_send(3,sender_id,"Pulled `2"+gms_self_name()+"`1 to your position!");
	         show_notification(spr_warning,"You've been pulled by `2"+puller+"`1.");
	         obj_player.target_x = real(ds_list_find_value(arguments,2));
	         obj_player.target_y = real(ds_list_find_value(arguments,3));
	      }
	   }
	}

	if (message_id = 9) { //View online
	   response = "Found player `2"+gms_self_name()+" `1in planet `2"+global.planet_name+"`1.";
	   gms_p2p_send(3,sender_id,response);
	}

	if (message_id = 10) { //Empty event
	}

	if (message_id = 11) { //Trade start
	   if (sender_id = gms_self_playerid()){return false}
	   totrade = string(ds_list_find_value(arguments,0));
	   if (string_lower(totrade) = string_lower(string_keywords_remove(gms_self_name()))){
	      if !(instance_exists(obj_trade)){
	         instance_create(0,0,obj_trade);
	         obj_trade.otherid = sender_id;
	         gms_p2p_send(14,sender_id,gms_self_name());
	      }
	   }
	}

	if (message_id = 12) { //Trade update
	   if (instance_exists(obj_trade)){
	      if !(obj_trade.otherid = sender_id){return false}
	      obj_trade.otheritem1 = string(ds_list_find_value(arguments,0));
	      obj_trade.otheritem1count = real(ds_list_find_value(arguments,1));
	      obj_trade.otheritem2 = string(ds_list_find_value(arguments,2));
	      obj_trade.otheritem2count = real(ds_list_find_value(arguments,3));
	      obj_trade.otheritem3 = string(ds_list_find_value(arguments,4));
	      obj_trade.otheritem3count = real(ds_list_find_value(arguments,5));
	      obj_trade.otheritem4 = string(ds_list_find_value(arguments,6));
	      obj_trade.otheritem4count = real(ds_list_find_value(arguments,7));
	      obj_trade.accepted = false; obj_trade.otheraccepted = false;
	      show_notification(spr_warning,"Other trader has updated their offer!");
	   }
	}

	if (message_id = 13) { //Trade accept or cancel
	   if (instance_exists(obj_trade)){
	      if !(obj_trade.otherid = sender_id){return false}
	      action = real(ds_list_find_value(arguments,0));
	      if (action = 1){
	         show_notification(spr_warning,"Other player has canceled the trade");
	         with obj_trade instance_destroy();
	      }
	      if (action = 2){
	         obj_trade.freeze = true;
	         obj_trade.otheraccepted = true;
	         chat_add("Other trader has accepted the trade, if the offer is right then click accept.");
	      }
	   }
	}

	if (message_id = 14) { //Trade verify
	   if !(instance_exists(obj_trade)){
	      instance_create(0,0,obj_trade);
	      obj_trade.otherid = sender_id;
	      chat_add("You are now trading with `2"+string(ds_list_find_value(arguments,0))+"`1.");
	   }
	}

	if (message_id = 15){ //Friend add
	   if (sender_id = gms_self_playerid()){return false}
	   toadd = string(ds_list_find_value(arguments,0));
	   adder = string(ds_list_find_value(arguments,1));
	   if (string_lower(toadd) = string_lower(string_keywords_remove(gms_self_name()))){
	      if (friend_exists(sender_id) = true){
	         gms_p2p_send(3,sender_id,"`2"+gms_self_name()+" `1is already your friend");
	         return false;
	      }
	      gms_p2p_send(3,sender_id,"Friend request sent to `2"+gms_self_name()+"`1!");
	      chat_add("`2"+adder+" `1wants to be your friend, use `6/friend "+adder+" `1to accept the request!");
	      global.friend = string_keywords_remove(string_lower(adder));
	   }
	}

	if (message_id = 16){ //Friend accept
	   toadd = string(ds_list_find_value(arguments,0));
	   adder = string(ds_list_find_value(arguments,1));
	   if (string_lower(toadd) = string_lower(string_keywords_remove(gms_self_name()))){
	      chat_add("You are now friends with `2"+adder+"`1!");
	      gms_p2p_send(17,sender_id,gms_self_name());
	      friend_add(sender_id);
	   }
	}

	if (message_id = 17){ //Friend accept response
	   adder = string(ds_list_find_value(arguments,0));
	   chat_add("You are now friends with `2"+adder+"`1!");
	   friend_add(sender_id);
	}

	if (message_id = 18){ //Friend status request
	   gms_p2p_send(19,sender_id,gms_self_name(),global.planet_name);
	}

	if (message_id = 19){ //Friend status responce
	   if (instance_exists(obj_friends)){
	      name = string(ds_list_find_value(arguments,0));
	      planet = string(ds_list_find_value(arguments,1));
	      n = string(obj_friends.numbers[? name]);
	      obj_friends.status[? n] = "in `2"+planet;
	   }
	}

	if (message_id = 20){ //Toggle lock access
	   toadd = string(ds_list_find_value(arguments,0));
	   if (string_lower(toadd) = string_lower(string_keywords_remove(gms_self_name()))){
	      if (instance_exists(obj_world)){
	         if (obj_world.admin = true){
	            gms_p2p_send(3,sender_id,"`1Removed `2"+gms_self_name()+"`1's temporary access to the lock.");
	            chat_add("Your access to the lock was removed!");
	            obj_world.admin = false;
	            return false;
	         }
	         if (obj_world.admin = false){
	            gms_p2p_send(3,sender_id,"`1Gave `2"+gms_self_name()+"`1's temporary access to the lock.");
	            chat_add("You received temporary access to the lock!");
	            obj_world.admin = true;
	            return false;
	         }
	      }
	   }
	}

	if (message_id = 21) { //Warning received
	   receiver = string(ds_list_find_value(arguments,0));
	   text = string(ds_list_find_value(arguments,1));
	   if (string_lower(receiver) = string_lower(string_keywords_remove(gms_self_name()))){
	      show_notification(spr_warning,text);
	   }
	}

	if (message_id = 22) { //Kick
	   if (sender_id = gms_self_playerid()){return false}
	   puller = string(ds_list_find_value(arguments,0));
	   topull = string(ds_list_find_value(arguments,1));
	   if (string_lower(topull) = string_lower(string_keywords_remove(gms_self_name()))){
	      gms_p2p_send(3,sender_id,"Kicked `2"+gms_self_name()+"`1 out of the planet!");
	      show_notification(spr_warning,"You've been kicked out of the planet by `2"+puller+"`1.");
	      planet_leave();
	   }
	}

	if (message_id = 23) { //Global kick
	   show_notification(spr_warning,"Server is down");
	   room = rm_login;
	}

	if (message_id = 24) { //Hit
	   if (instance_exists(obj_player)){
	      damage = real(ds_list_find_value(arguments,0));
	      sender = string(ds_list_find_value(arguments,1));
	      chat_add("`2"+sender+" `1hits you with `2"+string(damage)+"`1 damage!");
	      obj_player.player_health -= damage;
	   }
	}



}
