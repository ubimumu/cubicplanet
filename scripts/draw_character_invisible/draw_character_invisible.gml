/// @description draw_character_invisible()
function draw_character_invisible() {
	if (hsp < 0 and vsp = 0){ ///Move left
	   texture_set_interpolation(false);
	   draw_sprite(back_left,0,x,y);
	   draw_sprite(spr_invisible_player_head_left,0,x,y);
	   draw_sprite(hat_left,0,x,y);
	   draw_sprite(face_left,0,x,y);

	   if (leg = 0){
	      draw_sprite(spr_invisible_player_leg_1_left,0,x,y-1);
	      draw_sprite(spr_invisible_player_leg_2_left,0,x,y);
	      draw_sprite(leg1_left,0,x,y-1);
	      draw_sprite(leg2_left,0,x,y);
	   }

	   if (leg = 1){
	      draw_sprite(spr_invisible_player_leg_1_left,0,x,y);
	      draw_sprite(spr_invisible_player_leg_2_left,0,x,y-1);
	      draw_sprite(leg1_left,0,x,y);
	      draw_sprite(leg2_left,0,x,y-1);
	   }

	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+8,y+19,1,1,hand_1,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+8,y+19,1,1,hand_1,c_white,1);
	   draw_sprite(spr_invisible_player_body_right,0,x,y);
	   draw_sprite(body_left,0,x,y);
	   draw_sprite(pants_left,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+23,y+19,1,1,hand_2,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+23,y+19,1,1,hand_2,c_white,1);
	   draw_sprite_ext(hand_left,0,x+23,y+19,1,1,hand_2,c_white,1);
	   texture_set_interpolation(true);
	}

	if (hsp > 0 and vsp = 0){ ///Move right
	   texture_set_interpolation(false);
	   draw_sprite(back_right,0,x,y);
	   draw_sprite(spr_invisible_player_head_right,0,x,y);
	   draw_sprite(hat_right,0,x,y);
	   draw_sprite(face_right,0,x,y);

	   if (leg = 0){
	      draw_sprite(spr_invisible_player_leg_1_right,0,x,y-1);
	      draw_sprite(spr_invisible_player_leg_2_right,0,x,y);
	      draw_sprite(leg1_right,0,x,y-1);
	      draw_sprite(leg2_right,0,x,y);
	   }

	   if (leg = 1){
	      draw_sprite(spr_invisible_player_leg_1_right,0,x,y);
	      draw_sprite(spr_invisible_player_leg_2_right,0,x,y-1);
	      draw_sprite(leg1_right,0,x,y);
	      draw_sprite(leg2_right,0,x,y-1);
	   }

	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+23,y+19,1,1,hand_2,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+23,y+19,1,1,hand_2,c_white,1);
	   draw_sprite(spr_invisible_player_body_right,0,x,y);
	   draw_sprite(body_right,0,x,y);
	   draw_sprite(pants_right,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+8,y+19,1,1,hand_1,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+8,y+19,1,1,hand_1,c_white,1);
	   draw_sprite_ext(hand_right,0,x+8,y+19,1,1,hand_1,c_white,1);
	   texture_set_interpolation(true);
	}

	if (hsp = 0 and facing = 0 and vsp = 0){ ///Stay left
	   texture_set_interpolation(false);
	   draw_sprite(back_left,0,x,y);
	   draw_sprite(spr_invisible_player_head_left,0,x,y);
	   draw_sprite(hat_left,0,x,y);
	   draw_sprite(face_left,0,x,y);

	   draw_sprite(spr_invisible_player_leg_1_left,0,x,y);
	   draw_sprite(spr_invisible_player_leg_2_left,0,x,y);
	   draw_sprite(leg1_left,0,x,y);
	   draw_sprite(leg2_left,0,x,y);
   
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+8,y+19,1,1,0,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+8,y+19,1,1,0,c_white,1);
	   draw_sprite(spr_invisible_player_body_left,0,x,y);
	   draw_sprite(body_left,0,x,y);
	   draw_sprite(pants_left,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+23,y+19,1,1,0,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+23,y+19,1,1,0,c_white,1);
	   draw_sprite_ext(hand_left,0,x+23,y+19,1,1,0,c_white,1);
	   texture_set_interpolation(true);
	}

	if (hsp = 0 and facing = 1 and vsp = 0){ ///Stay right
	   texture_set_interpolation(false);
	   draw_sprite(back_right,0,x,y);
	   draw_sprite(spr_invisible_player_head_right,0,x,y);
	   draw_sprite(hat_right,0,x,y);
	   draw_sprite(face_right,0,x,y);

	   draw_sprite(spr_invisible_player_leg_1_right,0,x,y);
	   draw_sprite(spr_invisible_player_leg_2_right,0,x,y);
	   draw_sprite(leg1_right,0,x,y);
	   draw_sprite(leg2_right,0,x,y);
   
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+23,y+19,1,1,0,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+23,y+19,1,1,0,c_white,1);
	   draw_sprite(spr_invisible_player_body_right,0,x,y);
	   draw_sprite(body_right,0,x,y);
	   draw_sprite(pants_right,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+8,y+19,1,1,0,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+8,y+19,1,1,0,c_white,1);
	   draw_sprite_ext(hand_right,0,x+8,y+19,1,1,0,c_white,1);
	   texture_set_interpolation(true);
	}

	if (vsp < 0 and facing = 0){ ///Jump left
	   texture_set_interpolation(false);
	   draw_sprite(back_left,1,x,y);
	   draw_sprite(spr_invisible_player_head_left,1,x,y);
	   draw_sprite(hat_left,0,x,y);
	   draw_sprite(face_left,0,x,y);

	   draw_sprite(spr_invisible_player_leg_1_left,0,x,y);
	   draw_sprite(spr_invisible_player_leg_2_left,0,x,y);
	   draw_sprite(leg1_left,0,x,y);
	   draw_sprite(leg2_left,0,x,y);
   
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+8,y+19,1,1,-160,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+8,y+19,1,1,-160,c_white,1);
	   draw_sprite(spr_invisible_player_body_left,0,x,y);
	   draw_sprite(body_left,0,x,y);
	   draw_sprite(pants_left,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+23,y+19,1,1,-160,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+23,y+19,1,1,-160,c_white,1);
	   draw_sprite_ext(hand_left,0,x+23,y+19,1,1,-160,c_white,1);
	   texture_set_interpolation(true);
	}

	if (vsp < 0 and facing = 1){ ///Jump right
	   texture_set_interpolation(false);
	   draw_sprite(back_right,1,x,y);
	   draw_sprite(spr_invisible_player_head_right,1,x,y);
	   draw_sprite(hat_right,0,x,y);
	   draw_sprite(face_right,0,x,y);

	   draw_sprite(spr_invisible_player_leg_1_right,0,x,y);
	   draw_sprite(spr_invisible_player_leg_2_right,0,x,y);
	   draw_sprite(leg1_right,0,x,y);
	   draw_sprite(leg2_right,0,x,y);
   
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+23,y+19,1,1,160,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+23,y+19,1,1,160,c_white,1);
	   draw_sprite(spr_invisible_player_body_right,0,x,y);
	   draw_sprite(body_right,0,x,y);
	   draw_sprite(pants_right,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+8,y+19,1,1,160,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+8,y+19,1,1,160,c_white,1);
	   draw_sprite_ext(hand_right,0,x+8,y+19,1,1,160,c_white,1);
	   texture_set_interpolation(true);
	}

	if (vsp > 0 and facing = 0){ ///Fall left
	   texture_set_interpolation(false);
	   draw_sprite(back_left,2,x,y);
	   draw_sprite(spr_invisible_player_head_left,2,x,y);
	   draw_sprite(hat_left,0,x,y);
	   draw_sprite(face_left,0,x,y);

	   draw_sprite(spr_invisible_player_leg_1_left,0,x,y);
	   draw_sprite(spr_invisible_player_leg_2_left,0,x,y);
	   draw_sprite(leg1_left,0,x,y);
	   draw_sprite(leg2_left,0,x,y);
   
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+8,y+19,1,1,-35,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+8,y+19,1,1,-35,c_white,1);
	   draw_sprite(spr_invisible_player_body_left,0,x,y);
	   draw_sprite(body_left,0,x,y);
	   draw_sprite(pants_left,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_left,0,x+23,y+19,1,1,-35,c_white,1);
	   draw_sprite_ext(body_hand_left,0,x+23,y+19,1,1,-35,c_white,1);
	   draw_sprite_ext(hand_left,0,x+23,y+19,1,1,-35,c_white,1);
	   texture_set_interpolation(true);
	}

	if (vsp > 0 and facing = 1){ ///Fall right
	   texture_set_interpolation(false);
	   draw_sprite(back_right,2,x,y);
	   draw_sprite(spr_invisible_player_head_right,2,x,y);
	   draw_sprite(hat_right,0,x,y);
	   draw_sprite(face_right,0,x,y);

	   draw_sprite(spr_invisible_player_leg_1_right,0,x,y);
	   draw_sprite(spr_invisible_player_leg_2_right,0,x,y);
	   draw_sprite(leg1_right,0,x,y);
	   draw_sprite(leg2_right,0,x,y);
   
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+23,y+19,1,1,35,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+23,y+19,1,1,35,c_white,1);
	   draw_sprite(spr_invisible_player_body_right,0,x,y);
	   draw_sprite(body_right,0,x,y);
	   draw_sprite(pants_right,0,x,y);
	   draw_sprite_ext(spr_invisible_player_hand_right,0,x+8,y+19,1,1,35,c_white,1);
	   draw_sprite_ext(body_hand_right,0,x+8,y+19,1,1,35,c_white,1);
	   draw_sprite_ext(hand_right,0,x+8,y+19,1,1,35,c_white,1);
	   texture_set_interpolation(true);
	}



}
