/// @description Keyboard
if (gmkb_return_key_was_pressed() and os_type = os_android){
   typing = false;
   gmkb_hide_keyboard();
   if !(gmkb_get_text() = ""){
      chat_send(gmkb_get_text());
   }
}
if (gmkb_keyboard_did_hide() and typing = true){
   typing = false;
   gmkb_set_text("");
}

