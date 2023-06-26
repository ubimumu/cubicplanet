/// @description friend_find(id)
/// @param id
function friend_find(argument0) {
	argument0 = string(argument0);
	current = 1;
	repeat(25){
	   if (argument0 = ""){
	      if !(gms_ini_player_exists("friends",string(current))){
	         return current;
	      }
	   }
	   if !(argument0 = ""){
	      if (gms_ini_player_read("friends",string(current)) = argument0){
	         return current;
	      }
	   }
	   current += 1;
	}

	return 0;



}
