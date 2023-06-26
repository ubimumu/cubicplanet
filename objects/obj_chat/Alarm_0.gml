/// @description Send or start typing
if (typing = true){
   typing = false;
   gmkb_hide_keyboard();
   if !(gmkb_get_text() = ""){
      chat_send(gmkb_get_text());
   }
   return false;
}
if (typing = false){
   typing = true;
   gmkb_set_text("");
   gmkb_show_keyboard_ext(GMKB_TYPE_DEFAULT,GMKB_RK_TYPE_DONE,GMKB_APPEARANCE_LIGHT,GMKB_CAPITALIZE_SENTENCES,false,false,true);
   return false;
}

