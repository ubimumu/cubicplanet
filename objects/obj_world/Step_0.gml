/// @description Planet access control
was_used = 0;
if (planet_owner = "" and was_used = 0){
   global.access = 1;
   was_used = 1;
}

if (string(planet_owner) = string(gms_self_playerid()) and was_used = 0){
   global.access = 1;
   was_used = 1;
}

if (admin = true and was_used = 0){
   global.access = 1;
   was_used = 1;
}

if (was_used = 0){
   global.access = 0;
}

///Grid follow player
if (instance_exists(obj_player)){
   x = obj_player.x - 64;
   y = obj_player.y - 64;
   move_snap(32,32);
}


///Contact with inventory
if (instance_exists(obj_inventory)){
   block = obj_inventory.item;
   block = block_index(block);
   if !(block = 0){
      building = true;
      breaking = false;
      sprite_index = spr_grid;
   }
   if (block = 0){
      building = false;
      sprite_index = spr_none;
   }
}

