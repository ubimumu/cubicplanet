/// @description Selection
lastX = device_mouse_x_to_gui(0);
lastY = device_mouse_y_to_gui(0);

pos = 1;
dpy = 0;
repeat(10){
   dpx = 0;
   repeat(8){
      if (point_in_rectangle(lastX,lastY,posX+dpx,posY+dpy,posX+dpx+64,posY+dpy+64)){
         item = safe_ini_player_read_string("inventory_item",string(pos));
         info_x = dpx; info_y = dpy; info_id = item; info = true; alarm[0] = 60;
         selection = pos;
      }
      pos += 1;
      dpx += 64;
   }
   dpy += 64;
}




if (point_in_rectangle(lastX,lastY,posX+528,posY+0,posX+656,posY+64)){ //Use
   on_use(item);
}

if (point_in_rectangle(lastX,lastY,posX+528,posY+96,posX+656,posY+160)){ //Drop
   chat_add("This function is not available yet");
}

if (point_in_rectangle(lastX,lastY,posX+528,posY+192,posX+656,posY+256)){ //Delete
   chat_add("This function is not available yet");
}

if (point_in_rectangle(lastX,lastY,posX+528,posY+288,posX+656,posY+352)){ //About
   chat_add("This function is not available yet");
}

