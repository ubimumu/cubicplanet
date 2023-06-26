/// @description friend_add(id)
/// @param id
function friend_add(argument0) {
	if (friend_find(argument0) = 0){
	   empty = friend_find("");
	   if !(empty = 0){
	      gms_ini_player_write("friends",string(empty),argument0);
	      return true;
	   }
	}

	return false;



}
