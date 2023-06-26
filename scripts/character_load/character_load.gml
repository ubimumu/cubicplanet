/// @description character_load()
function character_load() {
	hat_left = spr_none;
	hat_right = spr_none;
	face_left = spr_none;
	face_right = spr_none;
	body_left = spr_none;
	body_hand_left = spr_none;
	body_right = spr_none;
	body_hand_right = spr_none;
	hand_left = spr_none;
	hand_right = spr_none;
	pants_left = spr_none;
	pants_right = spr_none;
	leg1_left = spr_none;
	leg1_right = spr_none;
	leg2_left = spr_none;
	leg2_right = spr_none;
	back_left = spr_none;
	back_right = spr_none;

	jumpspeed = 15;
	movespeed = 8;

	if (safe_ini_player_read_string("wearing","hand") = "pickaxe"){
	   hand_left = spr_pickaxe_left;
	   hand_right = spr_pickaxe_right;
	   global.weapon_power = 0.50;
	}

	if (safe_ini_player_read_string("wearing","face") = "mustache"){
	   face_left = spr_mustache_left;
	   face_right = spr_mustache_right;
	}

	if (safe_ini_player_read_string("wearing","hat") = "old_times_hat"){
	   hat_left = spr_old_times_hat_left;
	   hat_right = spr_old_times_hat_right;
	}

	if (safe_ini_player_read_string("wearing","legs") = "running_shoes"){
	   leg1_left = spr_shoes_1_left;
	   leg1_right = spr_shoes_1_right;
	   leg2_left = spr_shoes_2_left;
	   leg2_right = spr_shoes_2_right;
	   movespeed = 10;
	}

	if (safe_ini_player_read_string("wearing","shirt") = "black_jacket"){
	   body_left = spr_black_jacket_left;
	   body_right = spr_black_jacket_right;
	   body_hand_left = spr_black_jacket_hand_left;
	   body_hand_right = spr_black_jacket_hand_right;
	}

	if (safe_ini_player_read_string("wearing","pants") = "black_pants"){
	   pants_left = spr_black_pants_left;
	   pants_right = spr_black_pants_right;
	}

	if (safe_ini_player_read_string("wearing","hat") = "white_hood"){
	   hat_left = spr_white_hood_left;
	   hat_right = spr_white_hood_right;
	}

	if (safe_ini_player_read_string("wearing","hand") = "golden_sword"){
	   hand_left = spr_golden_sword_left;
	   hand_right = spr_golden_sword_right;
	   global.weapon_power = 0.75;
	}

	if (safe_ini_player_read_string("wearing","face") = "no_eyes"){
	   face_left = spr_no_eyes_left;
	   face_right = spr_no_eyes_right;
	}

	if (safe_ini_player_read_string("wearing","hat") = "chicken_head"){
	   face_left = spr_chicken_head_left;
	   face_right = spr_chicken_head_right;
	}

	if (safe_ini_player_read_string("wearing","shirt") = "chicken_body"){
	   body_left = spr_chicken_body_left;
	   body_right = spr_chicken_body_right;
	   body_hand_left = spr_chicken_body_hand_left;
	   body_hand_right = spr_chicken_body_hand_right;
	}

	if (safe_ini_player_read_string("wearing","legs") = "chicken_legs"){
	   leg1_left = spr_chicken_legs_1_left;
	   leg1_right = spr_chicken_legs_1_right;
	   leg2_left = spr_chicken_legs_2_left;
	   leg2_right = spr_chicken_legs_2_right;
	}

	if (safe_ini_player_read_string("wearing","hat") = "golden_hood"){
	   hat_left = spr_golden_hood_left;
	   hat_right = spr_golden_hood_right;
	}

	if (safe_ini_player_read_string("wearing","hat") = "golden_crown"){
	   hat_left = spr_golden_crown_left;
	   hat_right = spr_golden_crown_right;
	}

	if (safe_ini_player_read_string("wearing","hand") = "golden_pickaxe"){
	   hand_left = spr_golden_pickaxe_left;
	   hand_right = spr_golden_pickaxe_right;
	   global.weapon_power = 0.80;
	}

	if (safe_ini_player_read_string("wearing","shirt") = "golden_diaper"){
	   body_left = spr_golden_diaper_left;
	   body_right = spr_golden_diaper_right;
	}

	if (safe_ini_player_read_string("wearing","legs") = "golden_shoes"){
	   leg1_left = spr_golden_shoes_1_left;
	   leg1_right = spr_golden_shoes_1_right;
	   leg2_left = spr_golden_shoes_2_left;
	   leg2_right = spr_golden_shoes_2_right;
	   movespeed = 10;
	}

	if (safe_ini_player_read_string("wearing","back") = "yellow_wings"){
	   back_left = spr_yellow_wings_both;
	   back_right = spr_yellow_wings_both;
	   jumpspeed = 18;
	}

	if (safe_ini_player_read_string("wearing","back") = "blue_wings"){
	   back_left = spr_blue_wings_both;
	   back_right = spr_blue_wings_both;
	   jumpspeed = 18;
	}

	if (safe_ini_player_read_string("wearing","back") = "red_wings"){
	   back_left = spr_red_wings_both;
	   back_right = spr_red_wings_both;
	   jumpspeed = 18;
	}

	if (safe_ini_player_read_string("wearing","back") = "green_wings"){
	   back_left = spr_green_wings_both;
	   back_right = spr_green_wings_both;
	   jumpspeed = 18;
	}

	if (safe_ini_player_read_string("wearing","hat") = "male_hair"){
	   hat_left = spr_male_hair_left;
	   hat_right = spr_male_hair_right;
	}

	if (safe_ini_player_read_string("wearing","hat") = "ruby_hood"){
	   hat_left = spr_ruby_hood_left;
	   hat_right = spr_ruby_hood_right;
	}

	if (safe_ini_player_read_string("wearing","shirt") = "ruby_diaper"){
	   body_left = spr_ruby_diaper_left;
	   body_right = spr_ruby_diaper_right;
	}

	if (safe_ini_player_read_string("wearing","hand") = "ruby_pickaxe"){
	   hand_left = spr_ruby_pickaxe_left;
	   hand_right = spr_ruby_pickaxe_right;
	   global.weapon_power = 1.00;
	}

	if (safe_ini_player_read_string("wearing","legs") = "ruby_shoes"){
	   leg1_left = spr_ruby_shoes_1_left;
	   leg1_right = spr_ruby_shoes_1_right;
	   leg2_left = spr_ruby_shoes_2_left;
	   leg2_right = spr_ruby_shoes_2_right;
	   movespeed = 10;
	}

	if (safe_ini_player_read_string("wearing","hat") = "crystal_hood"){
	   hat_left = spr_crystal_hood_left;
	   hat_right = spr_crystal_hood_right;
	}

	if (safe_ini_player_read_string("wearing","shirt") = "crystal_diaper"){
	   body_left = spr_crystal_diaper_left;
	   body_right = spr_crystal_diaper_right;
	}

	if (safe_ini_player_read_string("wearing","hand") = "crystal_pickaxe"){
	   hand_left = spr_crystal_pickaxe_left;
	   hand_right = spr_crystal_pickaxe_right;
	   global.weapon_power = 1.50;
	}

	if (safe_ini_player_read_string("wearing","legs") = "crystal_shoes"){
	   leg1_left = spr_crystal_shoes_1_left;
	   leg1_right = spr_crystal_shoes_1_right;
	   leg2_left = spr_crystal_shoes_2_left;
	   leg2_right = spr_crystal_shoes_2_right;
	   movespeed = 10;
	}



}
