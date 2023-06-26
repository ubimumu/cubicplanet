/// @description Draw backgrounds
if instance_exists(obj_player){
   texture_set_interpolation(false);
   position = obj_player.x/4;
   draw_sprite(spr_background_default,0,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ));
   draw_sprite(spr_hills,0,__view_get( e__VW.XView, 0 )-position,__view_get( e__VW.YView, 0 )+128);
   texture_set_interpolation(true);
}

