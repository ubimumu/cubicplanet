/// @description Panning control
if (panning = true) {
   __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - ((window_mouse_get_x() - pan_last_x)) );
   __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - ((window_mouse_get_y() - pan_last_y)) );
   if (__view_get( e__VW.XView, 0 ) <= 0){
      __view_set( e__VW.XView, 0, 0 );
   }
   if ((__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )) > room_width){
      __view_set( e__VW.XView, 0, room_width - __view_get( e__VW.WView, 0 ) );
   }   
   if (__view_get( e__VW.YView, 0 ) <= 0){
      __view_set( e__VW.YView, 0, 0 );
   }
   if ((__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )) > room_height){
      __view_set( e__VW.YView, 0, room_height - __view_get( e__VW.HView, 0 ) );
   }        
   pan_last_x = window_mouse_get_x();
   pan_last_y = window_mouse_get_y();
}

