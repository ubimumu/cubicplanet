/// @description walls_load(y,string)
/// @param y
/// @param string
function walls_load(argument0, argument1) {
	position_y = argument0;
	position_x = 0;
	room_data = argument1;
	read_position = 1;

	repeat(48){
   
	   //Main group
	   if (string_copy(room_data,read_position,1) = "q"){instance_create(position_x,position_y,obj_wall_q)}
	   if (string_copy(room_data,read_position,1) = "w"){instance_create(position_x,position_y,obj_wall_w)}
	   if (string_copy(room_data,read_position,1) = "e"){instance_create(position_x,position_y,obj_wall_e)}
	   if (string_copy(room_data,read_position,1) = "r"){instance_create(position_x,position_y,obj_wall_r)}
	   if (string_copy(room_data,read_position,1) = "t"){instance_create(position_x,position_y,obj_wall_t)}
	   if (string_copy(room_data,read_position,1) = "y"){instance_create(position_x,position_y,obj_wall_y)}
	   if (string_copy(room_data,read_position,1) = "u"){instance_create(position_x,position_y,obj_wall_u)}
	   if (string_copy(room_data,read_position,1) = "i"){instance_create(position_x,position_y,obj_wall_i)}
	   if (string_copy(room_data,read_position,1) = "o"){instance_create(position_x,position_y,obj_wall_o)}
   
	   position_x += 32;
	   read_position += 1;
	}

	return true;



}
