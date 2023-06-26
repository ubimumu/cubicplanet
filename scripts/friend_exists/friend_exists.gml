/// @description friend_exists(id)
/// @param id
function friend_exists(argument0) {
	argument0 = string(argument0);
	current = 1;
	repeat(25){
	   if (string(gms_ini_player_read("friends",string(current))) = argument0){ 
	      return true;
	   }
	   current += 1;
	}

	return false;



}
