/// @description blocks_load(y,string)
/// @param y
/// @param string
function blocks_load(argument0, argument1) {
	position_y = argument0;
	position_x = 0;
	room_data = argument1;
	read_position = 1;

	repeat(48){
	   //Group Q*
	   if (string_copy(room_data,read_position,2) = "qq"){instance_create(position_x,position_y,obj_block_qq)}
	   if (string_copy(room_data,read_position,2) = "qw"){instance_create(position_x,position_y,obj_block_qw)}
	   if (string_copy(room_data,read_position,2) = "qe"){instance_create(position_x,position_y,obj_block_qe)}
	   if (string_copy(room_data,read_position,2) = "qr"){instance_create(position_x,position_y,obj_block_qr)}
	   if (string_copy(room_data,read_position,2) = "qt"){instance_create(position_x,position_y,obj_block_qt)}
	   if (string_copy(room_data,read_position,2) = "qy"){instance_create(position_x,position_y,obj_block_qy)}
	   if (string_copy(room_data,read_position,2) = "qu"){instance_create(position_x,position_y,obj_block_qu)}
	   if (string_copy(room_data,read_position,2) = "qi"){instance_create(position_x,position_y,obj_block_qi)}
	   if (string_copy(room_data,read_position,2) = "qo"){instance_create(position_x,position_y,obj_block_qo)}
	   if (string_copy(room_data,read_position,2) = "qp"){instance_create(position_x,position_y,obj_block_qp)}
	   if (string_copy(room_data,read_position,2) = "qa"){instance_create(position_x,position_y,obj_block_qa)}
	   if (string_copy(room_data,read_position,2) = "qs"){instance_create(position_x,position_y,obj_block_qs)}
	   if (string_copy(room_data,read_position,2) = "qd"){instance_create(position_x,position_y,obj_block_qd)}
	   if (string_copy(room_data,read_position,2) = "qf"){instance_create(position_x,position_y,obj_block_qf)}
	   if (string_copy(room_data,read_position,2) = "qg"){instance_create(position_x,position_y,obj_block_qg)}
	   if (string_copy(room_data,read_position,2) = "qh"){instance_create(position_x,position_y,obj_block_qh)}
	   if (string_copy(room_data,read_position,2) = "qj"){instance_create(position_x,position_y,obj_block_qj)}
	   if (string_copy(room_data,read_position,2) = "qk"){instance_create(position_x,position_y,obj_block_qk)}
	   if (string_copy(room_data,read_position,2) = "ql"){instance_create(position_x,position_y,obj_block_ql)}
	   if (string_copy(room_data,read_position,2) = "qz"){instance_create(position_x,position_y,obj_block_qz)}
	   if (string_copy(room_data,read_position,2) = "qx"){instance_create(position_x,position_y,obj_block_qx)}
	   if (string_copy(room_data,read_position,2) = "qc"){instance_create(position_x,position_y,obj_block_qc)}
	   if (string_copy(room_data,read_position,2) = "qv"){instance_create(position_x,position_y,obj_block_qv)}
	   if (string_copy(room_data,read_position,2) = "qb"){instance_create(position_x,position_y,obj_block_qb)}
	   if (string_copy(room_data,read_position,2) = "qn"){instance_create(position_x,position_y,obj_block_qn)}
	   if (string_copy(room_data,read_position,2) = "qm"){instance_create(position_x,position_y,obj_block_qm)}
   
	   //Group W*
	   if (string_copy(room_data,read_position,2) = "wq"){instance_create(position_x,position_y,obj_block_wq)}
	   if (string_copy(room_data,read_position,2) = "ww"){instance_create(position_x,position_y,obj_block_ww)}
	   if (string_copy(room_data,read_position,2) = "we"){instance_create(position_x,position_y,obj_block_we)}
	   if (string_copy(room_data,read_position,2) = "wr"){instance_create(position_x,position_y,obj_block_wr)}
	   if (string_copy(room_data,read_position,2) = "wt"){instance_create(position_x,position_y,obj_block_wt)}
	   if (string_copy(room_data,read_position,2) = "wy"){instance_create(position_x,position_y,obj_block_wy)}
	   if (string_copy(room_data,read_position,2) = "wu"){instance_create(position_x,position_y,obj_block_wu)}
	   if (string_copy(room_data,read_position,2) = "wi"){instance_create(position_x,position_y,obj_block_wi)}
	   if (string_copy(room_data,read_position,2) = "wo"){instance_create(position_x,position_y,obj_block_wo)}
	   if (string_copy(room_data,read_position,2) = "wp"){instance_create(position_x,position_y,obj_block_wp)}
   
   
	   position_x += 32;
	   read_position += 2;
	}

	return true;



}
