/// @description Button action
new_item = on_fuse(obj_slot_1.item,obj_slot_2.item);
if !(new_item = ""){
      show_notification(spr_warning,"Item fused.");
      sound_play(snd_complete);
      ic1 = inventory_item_get(obj_slot_1.item);
      ic2 = inventory_item_get(obj_slot_2.item);
      inventory_item_set(obj_slot_1.item,ic1 - 1);
      inventory_item_set(obj_slot_2.item,ic2 - 1);
      inventory_item_set(new_item,inventory_item_get(new_item) + 1);
      if (inventory_item_get(obj_slot_1.item) < 1){obj_slot_1.item = ""}
      if (inventory_item_get(obj_slot_2.item) < 1){obj_slot_2.item = ""}
}

