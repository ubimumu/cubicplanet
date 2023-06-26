/// @description Click control
if (keyboard_check_pressed(vk_f1)){
   if (freeze = true){
      chat_add("You can't change your offer anymore, other trader has already accepted this one");
      return false;
   }
   if (item1 = ""){
      if (item1 = on_slot_select()){return false}
      if (item2 = on_slot_select()){return false}
      if (item3 = on_slot_select()){return false}
      if (item4 = on_slot_select()){return false}
      item1 = on_slot_select();
   }
   newcount = get_integer("Set item count",item1count);
   if (newcount = 0){
      item1 = ""; 
      item1count = 0;
   }
   if (inventory_item_get(item1) >= newcount and newcount > 0){
      item1count = newcount;
   }
   alarm[0] = 5;
}

if (keyboard_check_pressed(vk_f2)){
   if (freeze = true){
      chat_add("You can't change your offer anymore, other trader has already accepted this one");
      return false;
   }
   if (item2 = ""){
      if (item1 = on_slot_select()){return false}
      if (item2 = on_slot_select()){return false}
      if (item3 = on_slot_select()){return false}
      if (item4 = on_slot_select()){return false}
      item2 = on_slot_select();
   }
   newcount = get_integer("Set item count",item2count);
   if (newcount = 0){
      item2 = ""; 
      item2count = 0;
   }
   if (inventory_item_get(item2) >= newcount and newcount > 0){
      item2count = newcount;
   }
   alarm[0] = 5;
}

if (keyboard_check_pressed(vk_f3)){
   if (freeze = true){
      chat_add("You can't change your offer anymore, other trader has already accepted this one");
      return false;
   }
   if (item3 = ""){
      if (item1 = on_slot_select()){return false}
      if (item2 = on_slot_select()){return false}
      if (item3 = on_slot_select()){return false}
      if (item4 = on_slot_select()){return false}
      item3 = on_slot_select();
   }
   newcount = get_integer("Set item count",item3count);
   if (newcount = 0){
      item3 = ""; 
      item3count = 0;
   }
   if (inventory_item_get(item3) >= newcount and newcount > 0){
      item3count = newcount;
   }
   alarm[0] = 5;
}

if (keyboard_check_pressed(vk_f4)){
   if (freeze = true){
      chat_add("You can't change your offer anymore, other trader has already accepted this one");
      return false;
   }
   if (item4 = ""){
      if (item1 = on_slot_select()){return false}
      if (item2 = on_slot_select()){return false}
      if (item3 = on_slot_select()){return false}
      if (item4 = on_slot_select()){return false}
      item4 = on_slot_select();
   }
   newcount = get_integer("Set item count",item4count);
   if (newcount = 0){
      item4 = ""; 
      item4count = 0;
   }
   if (inventory_item_get(item4) >= newcount and newcount > 0){
      item4count = newcount;
   }
   alarm[0] = 5;
}

if (keyboard_check_pressed(vk_f5)){
   show_notification(spr_warning,"You canceled the trade");
   gms_p2p_send(13,otherid,1);
   instance_destroy();
}

if (keyboard_check_pressed(vk_f6)){
   chat_add("Other's offer accepted, waiting for other trader to accept yours.");
   gms_p2p_send(13,otherid,2);
   accepted = true;
}

///Transfer control
if (accepted = true and otheraccepted = true){
   //Remove self items
   inventory_item_set(item1,inventory_item_get(item1) - item1count);
   inventory_item_set(item2,inventory_item_get(item2) - item2count);
   inventory_item_set(item3,inventory_item_get(item3) - item3count);
   inventory_item_set(item4,inventory_item_get(item4) - item4count);
   
   //Add other's items
   inventory_item_set(otheritem1,inventory_item_get(otheritem1) + otheritem1count);
   inventory_item_set(otheritem2,inventory_item_get(otheritem2) + otheritem2count);
   inventory_item_set(otheritem3,inventory_item_get(otheritem3) + otheritem3count);
   inventory_item_set(otheritem4,inventory_item_get(otheritem4) + otheritem4count);
   
   //End the trade
   instance_destroy();
}

