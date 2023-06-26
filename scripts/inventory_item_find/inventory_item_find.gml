/// @description inventory_item_find(name)
/// @param name
function inventory_item_find(argument0) {
	in = string(argument0);
	current = 1;
	repeat(100){
	   cn = safe_ini_player_read_string("inventory_item",string(current));
	   if (string_lower(cn) = string_lower(in)){
	      return current;
	   }
	   current += 1;
	}

	current = 1;
	repeat(100){
	   if !(safe_ini_player_exists("inventory_item",string(current))){
	      return current;
	   }
	   current += 1;
	}

	return 0;



}
