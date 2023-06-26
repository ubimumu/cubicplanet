/// @description inventory_item_set(name,count)
/// @param name
/// @param count
function inventory_item_set(argument0, argument1) {
	key = string(inventory_item_find(argument0));
	count = real(argument1);
	if (count > 0){
	   safe_ini_player_write("inventory_item",key,argument0);
	   safe_ini_player_write("inventory_item_count",key,string(count));
	}
	if (count < 1){
	   safe_ini_player_delete("inventory_item",key);
	   safe_ini_player_delete("inventory_item_count",key);
	}



}
