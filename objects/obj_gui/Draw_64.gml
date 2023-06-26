/// @description Draw mobile gui
if (mobile = true){
   draw_sprite(spr_move_left,1,32,640);
   draw_sprite(spr_move_right,1,192,640);
   draw_sprite(spr_move_up,1,1248,640);
}

///Draw planet gui
if (options = true){
   if (obj_chat.typing = false){
      draw_sprite(spr_send_message,0,1248,32);
   }
   if (obj_chat.typing = true){
      draw_sprite(spr_send_message,1,1248,32);
   }
   draw_sprite(spr_menus,1,32,32);
   draw_sprite(spr_gem_icon,1,48,188);
   draw_string(80,241,safe_ini_player_read_string("status","gems"),c_black,true,fnt_default);
   draw_string(80,239,safe_ini_player_read_string("status","gems"),c_black,true,fnt_default);
   draw_string(81,240,safe_ini_player_read_string("status","gems"),c_black,true,fnt_default);
   draw_string(79,240,safe_ini_player_read_string("status","gems"),c_black,true,fnt_default);
   draw_string(80,240,safe_ini_player_read_string("status","gems"),c_white,true,fnt_default);
   draw_sprite(spr_zoom_in,1,1280,160);
   draw_sprite(spr_zoom_out,1,1280,256);
}

