/// @description on_item_draw(x,y,name,count)
/// @param x
/// @param y
/// @param name
/// @param count
function on_item_draw(argument0, argument1, argument2, argument3) {

	sprite = spr_none;

	//Tools
	if (argument2 = "break_tool"){sprite = spr_break_tool}
	if (argument2 = "editing_tool"){sprite = spr_editing_tool}

	//Blocks
	if (argument2 = "obj_block_qq"){sprite = spr_block_qq}
	if (argument2 = "obj_block_qw"){sprite = spr_block_qw}
	if (argument2 = "obj_block_qe"){sprite = spr_block_qe}
	if (argument2 = "obj_block_qr"){sprite = spr_block_qr}
	if (argument2 = "obj_block_qt"){sprite = spr_block_qt}
	if (argument2 = "obj_block_qy"){sprite = spr_block_qy}
	if (argument2 = "obj_block_qu"){sprite = spr_block_qu}
	if (argument2 = "obj_block_qi"){sprite = spr_block_qi}
	if (argument2 = "obj_block_qo"){sprite = spr_block_qo}
	if (argument2 = "obj_block_qp"){sprite = spr_block_qp}
	if (argument2 = "obj_block_qa"){sprite = spr_block_qa}
	if (argument2 = "obj_block_qs"){sprite = spr_block_qs}
	if (argument2 = "obj_block_qd"){sprite = spr_block_qd}
	if (argument2 = "obj_block_qf"){sprite = spr_block_qf}
	if (argument2 = "obj_block_qg"){sprite = spr_block_qg}
	if (argument2 = "obj_block_qh"){sprite = spr_block_qh}
	if (argument2 = "obj_block_qj"){sprite = spr_block_qj}
	if (argument2 = "obj_block_qk"){sprite = spr_block_qk}
	if (argument2 = "obj_block_ql"){sprite = spr_block_ql}
	if (argument2 = "obj_block_qz"){sprite = spr_block_qz}
	if (argument2 = "obj_block_qx"){sprite = spr_block_qx}
	if (argument2 = "obj_block_qc"){sprite = spr_block_qc}
	if (argument2 = "obj_block_qv"){sprite = spr_block_qv}
	if (argument2 = "obj_block_qb"){sprite = spr_block_qb}
	if (argument2 = "obj_block_qn"){sprite = spr_block_qn}
	if (argument2 = "obj_block_qm"){sprite = spr_block_qm}

	if (argument2 = "obj_block_wq"){sprite = spr_block_wq}
	if (argument2 = "obj_block_ww"){sprite = spr_block_ww}
	if (argument2 = "obj_block_we"){sprite = spr_block_we}
	if (argument2 = "obj_block_wr"){sprite = spr_block_wr}
	if (argument2 = "obj_block_wt"){sprite = spr_block_wt}
	if (argument2 = "obj_block_wy"){sprite = spr_block_wy}
	if (argument2 = "obj_block_wu"){sprite = spr_block_wu}
	if (argument2 = "obj_block_wi"){sprite = spr_block_wi}
	if (argument2 = "obj_block_wo"){sprite = spr_block_wo}
	if (argument2 = "obj_block_wp"){sprite = spr_block_wp}


	//Walls
	if (argument2 = "obj_wall_q"){sprite = spr_wall_q}
	if (argument2 = "obj_wall_w"){sprite = spr_wall_w}
	if (argument2 = "obj_wall_e"){sprite = spr_wall_e}
	if (argument2 = "obj_wall_r"){sprite = spr_wall_r}
	if (argument2 = "obj_wall_t"){sprite = spr_wall_t}
	if (argument2 = "obj_wall_y"){sprite = spr_wall_y}
	if (argument2 = "obj_wall_u"){sprite = spr_wall_u}
	if (argument2 = "obj_wall_i"){sprite = spr_wall_i}
	if (argument2 = "obj_wall_o"){sprite = spr_wall_o}

	//Wearables
	if (argument2 = "pickaxe"){sprite = spr_pickaxe}
	if (argument2 = "running_shoes"){sprite = spr_running_shoes}
	if (argument2 = "old_times_hat"){sprite = spr_old_times_hat}
	if (argument2 = "mustache"){sprite = spr_mustache}
	if (argument2 = "black_jacket"){sprite = spr_black_jacket}
	if (argument2 = "black_pants"){sprite = spr_black_pants}
	if (argument2 = "white_hood"){sprite = spr_white_hood}
	if (argument2 = "golden_sword"){sprite = spr_golden_sword}
	if (argument2 = "no_eyes"){sprite = spr_no_eyes}
	if (argument2 = "chicken_head"){sprite = spr_chicken_head}
	if (argument2 = "chicken_body"){sprite = spr_chicken_body}
	if (argument2 = "chicken_legs"){sprite = spr_chicken_legs}
	if (argument2 = "chicken"){sprite = spr_chicken}
	if (argument2 = "golden_hood"){sprite = spr_golden_hood}
	if (argument2 = "golden_crown"){sprite = spr_golden_crown}
	if (argument2 = "golden_diaper"){sprite = spr_golden_diaper}
	if (argument2 = "golden_pickaxe"){sprite = spr_golden_pickaxe}
	if (argument2 = "golden_shoes"){sprite = spr_golden_shoes}
	if (argument2 = "yellow_wings"){sprite = spr_yellow_wings}
	if (argument2 = "blue_wings"){sprite = spr_blue_wings}
	if (argument2 = "red_wings"){sprite = spr_red_wings}
	if (argument2 = "green_wings"){sprite = spr_green_wings}
	if (argument2 = "male_hair"){sprite = spr_male_hair}
	if (argument2 = "ruby_hood"){sprite = spr_ruby_hood}
	if (argument2 = "ruby_diaper"){sprite = spr_ruby_diaper}
	if (argument2 = "ruby_pickaxe"){sprite = spr_ruby_pickaxe}
	if (argument2 = "ruby_shoes"){sprite = spr_ruby_shoes}
	if (argument2 = "crystal_hood"){sprite = spr_crystal_hood}
	if (argument2 = "crystal_diaper"){sprite = spr_crystal_diaper}
	if (argument2 = "crystal_pickaxe"){sprite = spr_crystal_pickaxe}
	if (argument2 = "crystal_shoes"){sprite = spr_crystal_shoes}



	draw_sprite_stretched(sprite,1,argument0+6,argument1+6,52,52); 
	draw_set_halign(fa_right); 
	draw_set_font(fnt_default);
	draw_set_color(c_black);
	draw_text(argument0+60,argument1+39,string_hash_to_newline(string(argument3))); 
	draw_text(argument0+60,argument1+41,string_hash_to_newline(string(argument3))); 
	draw_text(argument0+59,argument1+40,string_hash_to_newline(string(argument3))); 
	draw_text(argument0+61,argument1+40,string_hash_to_newline(string(argument3))); 
	draw_set_color(c_white);
	draw_text(argument0+60,argument1+40,string_hash_to_newline(string(argument3))); 
	draw_set_halign(0);



}
