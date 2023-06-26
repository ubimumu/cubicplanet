/// @description Button action
if (string_length(obj_textbox_username.text) < 1){
 show_notification(spr_block_qj,"Please fill username textbox");
 return false;
}
if (string_length(obj_textbox_password.text) < 1){
 show_notification(spr_block_qj,"Please fill password textbox");
 return false;
}
if (obj_checkbox_no_account.checked = false){
 gms_login_set_username("WA_"+obj_textbox_username.text);
 gms_login_set_password(obj_textbox_password.text);
 gms_login_execute(on_login);
}
if (obj_checkbox_no_account.checked = true){
 gms_register("WA_"+obj_textbox_username.text,
 obj_textbox_password.text,
 obj_textbox_password.text,
 obj_textbox_email.text,
 on_register);
}

loading = true;

