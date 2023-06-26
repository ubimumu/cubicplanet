/// @description Control clicks
lastX = device_mouse_x_to_gui(0);
lastY = device_mouse_y_to_gui(0);

///Press
if (mouse_check_button_pressed(mb_left)){
   if (point_in_rectangle(lastX,lastY,32,32,128,128)){ //Options
      show_options("planet",global.planet_name,"Leave","Respawn","Cancel");
   }
   if (point_in_rectangle(lastX,lastY,1248,32,1344,128)){ //Chat
      obj_chat.alarm[0] = 1;
   }
}

///Hold
if (mouse_check_button(mb_left)){
   if (point_in_rectangle(lastX,lastY,1280,160,1344,224)){

   }
   if (point_in_rectangle(lastX,lastY,1280,256,1344,320)){
      if (target_zoom_w < zoom_max_w){
         target_zoom_w += 20
         target_zoom_h += 10
      }
   }
}

///Control variables
__view_set( e__VW.WView, 0, lerp(__view_get( e__VW.WView, 0 ), target_zoom_w, .2) );
__view_set( e__VW.HView, 0, lerp(__view_get( e__VW.HView, 0 ), target_zoom_h, .2) );

