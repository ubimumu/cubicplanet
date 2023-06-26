/// @description chat_send(text)
/// @param text
function chat_send(argument0) {
	chat_text = string(argument0);
	chat_name = string(gms_self_name());

	chat_text = string_replace_all(chat_text,"#","");

	if !(string_copy(chat_text,1,1) = "/"){
	   final_chat_name = "`9<`1"+chat_name+"`9>`1 ";
	   final_chat_text = final_chat_name + chat_text;
	   gms_p2p_send(3,gms_p2p_all_in_session,final_chat_text);
	   if (instance_exists(obj_player)){
	      obj_player.message = chat_text;
	      obj_player.alarm[0] = 180;
	   }
	}

	if (string_copy(chat_text,1,1) = "/"){
	   debug_chat_text = string_keywords_remove(chat_text);
	   chat_add("`3"+string(debug_chat_text));
	   on_command(chat_text);
	}



}
