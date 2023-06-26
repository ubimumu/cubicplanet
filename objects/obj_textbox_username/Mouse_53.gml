/// @description Focus
if (position_meeting(mouse_x,mouse_y,self)){
   gmkb_set_text(text);
   gmkb_show_keyboard_ext(GMKB_TYPE_DEFAULT,GMKB_RK_TYPE_DONE,GMKB_APPEARANCE_LIGHT,GMKB_CAPITALIZE_SENTENCES,false,false,true);
   focus = true;
}
if !(position_meeting(mouse_x,mouse_y,self)){
   focus = false;
}

