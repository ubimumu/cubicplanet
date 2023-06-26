/// @description on_register(callback)
/// @param callback
function on_register(argument0) {
	if (instance_exists(obj_button_login)){obj_button_login.loading = false}
	switch(argument0)
	{
	  case re_ok:
	  global.__name = string_copy(global.__name,4,string_length(global.__name));
	  show_notification(spr_warning,"`1Your account `2"+string(gms_self_name())+"`1 was created successfully!");
	  break;
  
	  case re_ip_limit:
	  show_notification(spr_block_qj,"`4Oops`1, you've created too much accounts on this device, try again later!");
	  break;
  
	  case re_mail_in_use:
	  show_notification(spr_block_qj,"`4Oops`1, this email address is already being used by another account!");
	  break;
  
	  case re_name_in_use:
	  show_notification(spr_block_qj,"`4Oops`1, someone has already taken this username!");
	  break;
  
	  case re_mail_invalid:
	  show_notification(spr_block_qj,"`4Oops`1, please enter a valid email address before you can create account!");
	  break;
  
	  case re_name_invalid:
	  show_notification(spr_block_qj,"`4Oops`1, that username is not allowed!");
	  break;
  
	  case re_name_too_short:
	  show_notification(spr_block_qj,"`4Oops`1, that username is too short!");
	  break;
  
	  case re_pass_not_equal:
	  show_notification(spr_block_qj,"`4Oops`1, unexpected error.");
	  break;
  
	  case re_pass_too_short:
	  show_notification(spr_block_qj,"`4Oops`1, your password is too short, choose a longer one!");
	  break;

	}



}
