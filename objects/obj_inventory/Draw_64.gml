/// @description Draw
draw_set_color(c_white);
draw_sprite(spr_inventory,0,posX-32,posY-32);

pos = 1;
row = 1;
dpy = posY;

repeat(10){
   col = 1;
   dpx = posX;
   repeat(8){
         in = safe_ini_player_read_string("inventory_item",string(pos));
         ic = safe_ini_player_read_real("inventory_item_count",string(pos));
         if (safe_ini_player_exists("inventory_item_count",string(pos))){
            if (selection = pos){
               draw_sprite(spr_selection,0,dpx,dpy);
               if (info = true){
                  draw_text_cover(dpx+32,dpy-16,item_name(item));
               }
            }
            on_item_draw(dpx,dpy,in,ic);
            if (safe_ini_player_read_string("wearing","hat") = in)
            or (safe_ini_player_read_string("wearing","face") = in)
            or (safe_ini_player_read_string("wearing","shirt") = in)
            or (safe_ini_player_read_string("wearing","pants") = in)
            or (safe_ini_player_read_string("wearing","hand") = in)
            or (safe_ini_player_read_string("wearing","back") = in)
            or (safe_ini_player_read_string("wearing","legs") = in){
               draw_sprite(spr_checked,0,dpx,dpy);
            }
         }
      col += 1;
      pos += 1;
      dpx += 64;
   }
   row += 1;
   dpy += 64;
}

///Drag proccess
draw_sprite(spr_drag,1,dragPosX,dragPosY);

gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);

if (point_in_rectangle(gui_mouse_x,gui_mouse_y,dragPosX-64,dragPosY-32,dragPosX+64,dragPosY+32)and mouse_check_button(mb_left)){
   dragPosY = gui_mouse_y; 
   global.drag = true;
} 
else{
   global.drag = false;
}

if (dragPosY < dragPosYmin){dragPosY = dragPosYmin}
if (dragPosY > dragPosYmax){dragPosY = dragPosYmax}

posY = dragPosY + 48;

