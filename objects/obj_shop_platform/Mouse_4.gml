/// @description Buy the item
if !(safe_ini_player_read_real("status","gems") > cost - 2){
   show_notification(spr_warning,"Sorry, you can't afford this item, it costs `2"+price+" `1gems.");
   return false;
}
if (safe_ini_player_read_real("status","gems") > cost - 2){
   show_notification(spr_warning,"Bought `2"+title+" `1 for `2"+price+" `1gems.");
   safe_ini_player_write("status","gems",safe_ini_player_read_real("status","gems") - cost);
   ic = inventory_item_get(name);
   inventory_item_set(name,ic + 1);
}

