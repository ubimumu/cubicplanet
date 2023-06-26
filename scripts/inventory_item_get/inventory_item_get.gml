/// @description inventory_item_get(name)
/// @param name
function inventory_item_get(argument0) {
	key = string(inventory_item_find(argument0));
	if !(safe_ini_player_exists("inventory_item_count",key)){
	return false;
	}
	count = safe_ini_player_read_real("inventory_item_count",key);

	if (count > 0){
	   return count;
	}

	return 0;



}
