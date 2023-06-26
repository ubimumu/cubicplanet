/// @description Breaking
if !(point_in_rectangle(obj_player.x,obj_player.y,x-96,y-96,x+128,y+128)){
   return false;
}

if (place_meeting(x,y,par_block) or place_meeting(x,y,par_deco)){
   return false;
}

if (global.drag = true){
   return false;
}

if (global.access = 0){
   return false;
}
if (broken = true){
   return false;
}

if (break_progress = 0){
   par_building.break_progress = 0;
   break_progress = 0.10;
}

if (obj_inventory.item = "break_tool"){
   break_progress += break_speed;
   alarm[0] = 360;
   if (break_progress > 10){
      gms_p2p_send(2,gms_p2p_all_in_session,code);
      broken = true;
      on_break(object_index,x,y,code);
      obj_world.alarm[0] = 10;
   }
}

if (obj_inventory.item = "editing_tool"){
   on_wrench(object_index,x,y,code);
}

