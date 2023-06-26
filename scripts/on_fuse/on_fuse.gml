/// @description on_fuse(item1,item2)
/// @param item1
/// @param item2
function on_fuse(argument0, argument1) {
	item1 = string(argument0);
	item2 = string(argument1);

	if (item1 = "obj_block_qw" and item2 = "obj_block_qr"){return "obj_block_qt"}
	if (item1 = "obj_block_qw" and item2 = "obj_block_qe"){return "obj_block_qy"}
	if (item1 = "obj_block_qr" and item2 = "obj_block_qw"){return "obj_block_qu"}
	if (item1 = "obj_block_qr" and item2 = "obj_block_qe"){return "obj_block_qi"}
	if (item1 = "obj_block_qe" and item2 = "obj_block_qw"){return "obj_block_qo"}
	if (item1 = "obj_block_qe" and item2 = "obj_block_qr"){return "obj_block_qp"}

	if (item1 = "obj_block_qt" and item2 = "obj_block_qy"){return "obj_block_qa"}
	if (item1 = "obj_block_qy" and item2 = "obj_block_qt"){return "obj_block_qs"}
	if (item1 = "obj_block_qu" and item2 = "obj_block_qi"){return "obj_block_qd"}
	if (item1 = "obj_block_qi" and item2 = "obj_block_qu"){return "obj_block_qf"}
	if (item1 = "obj_block_qo" and item2 = "obj_block_qp"){return "obj_block_qg"}
	if (item1 = "obj_block_qp" and item2 = "obj_block_qo"){return "obj_block_qh"}

	if (item1 = "obj_block_qa" and item2 = "obj_block_qs"){return "obj_block_qv"}
	if (item1 = "obj_block_qs" and item2 = "obj_block_qa"){return "obj_block_qb"}
	if (item1 = "obj_block_qd" and item2 = "obj_block_qf"){return "obj_block_qn"}
	if (item1 = "obj_block_qf" and item2 = "obj_block_qd"){return "obj_block_qm"}
	if (item1 = "obj_block_qg" and item2 = "obj_block_qh"){return "obj_block_wq"}
	if (item1 = "obj_block_qh" and item2 = "obj_block_qg"){return "obj_block_ww"}
	if (item1 = "obj_block_ql" and item2 = "obj_block_qr"){return "obj_block_we"}

	if (item1 = "obj_block_qr" and item2 = "obj_block_qj"){return "obj_block_qk"}

	if (item1 = "obj_wall_q" and item2 = "obj_wall_w"){return "obj_wall_r"}
	if (item1 = "obj_wall_w" and item2 = "obj_wall_q"){return "obj_wall_t"}
	if (item1 = "obj_wall_e" and item2 = "obj_wall_q"){return "obj_wall_y"}
	if (item1 = "obj_wall_q" and item2 = "obj_wall_e"){return "obj_wall_u"}
	if (item1 = "obj_wall_w" and item2 = "obj_wall_e"){return "obj_wall_i"}
	if (item1 = "obj_wall_e" and item2 = "obj_wall_w"){return "obj_wall_o"}

	if (item1 = "obj_block_qj" and item2 = "obj_block_qh"){return "pickaxe"}
	if (item1 = "obj_block_qj" and item2 = "obj_block_qp"){return "old_times_hat"}
	if (item1 = "obj_block_qj" and item2 = "obj_block_qa"){return "mustache"}
	if (item1 = "obj_block_qj" and item2 = "obj_block_qf"){return "running_shoes"}
	if (item1 = "obj_block_qw" and item2 = "obj_block_qt"){return "black_jacket"}
	if (item1 = "obj_block_qw" and item2 = "obj_block_qy"){return "black_pants"}
	if (item1 = "obj_block_qo" and item2 = "old_times_hat"){return "white_hood"}
	if (item1 = "obj_block_qe" and item2 = "mustache"){return "no_eyes"}
	if (item1 = "obj_block_qj" and item2 = "obj_block_qu"){return "golden_sword"}

	if (item1 = "obj_block_qx" and item2 = "white_hood"){return "golden_hood"}
	if (item1 = "obj_block_qx" and item2 = "pickaxe"){return "golden_pickaxe"}
	if (item1 = "obj_block_qx" and item2 = "black_jacket"){return "golden_diaper"}
	if (item1 = "obj_block_qx" and item2 = "running_shoes"){return "golden_shoes"}

	if (item1 = "obj_block_qc" and item2 = "golden_hood"){return "ruby_hood"}
	if (item1 = "obj_block_qc" and item2 = "golden_pickaxe"){return "ruby_pickaxe"}
	if (item1 = "obj_block_qc" and item2 = "golden_diaper"){return "ruby_diaper"}
	if (item1 = "obj_block_qc" and item2 = "golden_shoes"){return "ruby_shoes"}

	if (item1 = "obj_block_wr" and item2 = "ruby_hood"){return "crystal_hood"}
	if (item1 = "obj_block_wr" and item2 = "ruby_pickaxe"){return "crystal_pickaxe"}
	if (item1 = "obj_block_wr" and item2 = "ruby_diaper"){return "crystal_diaper"}
	if (item1 = "obj_block_wr" and item2 = "ruby_shoes"){return "crystal_shoes"}

	if (item1 = "obj_block_qc" and item2 = "obj_block_qt"){return "red_wings"}
	if (item1 = "obj_block_qc" and item2 = "obj_block_qy"){return "green_wings"}
	if (item1 = "obj_block_qc" and item2 = "obj_block_qu"){return "yellow_wings"}
	if (item1 = "obj_block_qc" and item2 = "obj_block_qi"){return "blue_wings"}

	if (item1 = "obj_block_qj" and item2 = "obj_block_qw"){return "male_hair"}

	return "";



}
