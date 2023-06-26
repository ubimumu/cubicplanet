function on_wear(argument0) {
	//on_wear(id)
	if (instance_exists(obj_player)){
	   obj_player.alarm[3] = 1;
	}

	__name = "pickaxe"; __part = "hand";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "running_shoes"; __part = "legs";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "old_times_hat"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "mustache"; __part = "face";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "black_jacket"; __part = "shirt";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "black_pants"; __part = "pants";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "white_hood"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "golden_sword"; __part = "hand";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "no_eyes"; __part = "face";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "chicken_head"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "chicken_body"; __part = "shirt";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "chicken_legs"; __part = "legs";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "golden_hood"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "golden_crown"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "golden_diaper"; __part = "shirt";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "golden_pickaxe"; __part = "hand";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "golden_shoes"; __part = "legs";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "yellow_wings"; __part = "back";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "blue_wings"; __part = "back";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "red_wings"; __part = "back";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "green_wings"; __part = "back";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "male_hair"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "ruby_hood"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "ruby_diaper"; __part = "shirt";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "ruby_pickaxe"; __part = "hand";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "ruby_shoes"; __part = "legs";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "crystal_hood"; __part = "hat";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "crystal_diaper"; __part = "shirt";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "crystal_pickaxe"; __part = "hand";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}

	__name = "crystal_shoes"; __part = "legs";
	if (argument0 = __name){ 
	   if (safe_ini_player_read_string("wearing",__part) = __name){
	   safe_ini_player_write("wearing",__part,""); return true}
	   safe_ini_player_write("wearing",__part,__name); return false;
	}



}
