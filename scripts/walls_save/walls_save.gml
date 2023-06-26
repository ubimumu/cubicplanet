/// @description walls_save(y)
/// @param y
function walls_save(argument0) {
	position_y = argument0;
	position_x = 0;
	room_data = "";

	repeat(48){
   
	   was_used = 0;
   
	   //Main group
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_q)){room_data = string(room_data) + "q"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_w)){room_data = string(room_data) + "w"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_e)){room_data = string(room_data) + "e"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_r)){room_data = string(room_data) + "r"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_t)){room_data = string(room_data) + "t"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_y)){room_data = string(room_data) + "y"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_u)){room_data = string(room_data) + "u"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_i)){room_data = string(room_data) + "i"; was_used = 1}
	   if (was_used = 0 and position_meeting(position_x+16,position_y+16,obj_wall_o)){room_data = string(room_data) + "o"; was_used = 1}
   
   
	   if (was_used = 0){
	   room_data = string(room_data) + "0";
	   }
   
	   position_x += 32;
	}

	return room_data;



}
