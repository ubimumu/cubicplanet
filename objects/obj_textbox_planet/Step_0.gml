/// @description Input
if (focus = true){
   if (gmkb_text_did_change()){
      text = gmkb_get_text();
      text = string_copy(text,1,15);
      text = string_lettersdigits(text);
      alarm[0] = 30;
   }
   if (gmkb_keyboard_did_hide()){
      focus = false;
   }
   if (gmkb_return_key_was_pressed()){
      gmkb_hide_keyboard();
   }
}

