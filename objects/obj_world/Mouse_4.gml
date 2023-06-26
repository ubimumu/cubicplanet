/// @description Build
block = obj_inventory.item;
if (global.access = 0){return false}
if (string_pos("obj_wall",block) and position_meeting(mouse_x,mouse_y,par_block)){return false}
if (string_pos("obj_block",block) and position_meeting(mouse_x,mouse_y,par_deco)){return false}
if (string_pos("obj_block",block) and position_meeting(mouse_x,mouse_y,par_block)){return false}
if (string_pos("obj_wall",block) and position_meeting(mouse_x,mouse_y,par_wall)){return false}
if (string_pos("obj_deco",block) and position_meeting(mouse_x,mouse_y,par_block)){return false}
if (string_pos("obj_deco",block) and position_meeting(mouse_x,mouse_y,par_deco)){return false}
if (instance_exists(obj_options)){return false}

if (block = "obj_block_qj" or block = "obj_block_qc" or block = "obj_block_wr"){
   if (instance_exists(obj_block_qj)){return false}
   if (instance_exists(obj_block_qc)){return false}
   if (instance_exists(obj_block_wr)){return false}
}

inventory_item_set(block,inventory_item_get(block) - 1);

if (inventory_item_get(block) < 1){
   obj_inventory.selection = 1;
   obj_inventory.item = "break_tool";
   building = false;
}

place_x = align_grid(mouse_x); 
place_y = align_grid(mouse_y);
gms_p2p_send(1,gms_p2p_all_in_session,string(place_x),string(place_y),block_index(block));
instance_create(place_x,place_y,obj_placed);
obj_world.alarm[0] = 20;
on_build(block);

