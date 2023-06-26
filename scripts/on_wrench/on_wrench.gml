/// @description on_wrench(item,x,y,code)
/// @param item
/// @param x
/// @param y
/// @param code
function on_wrench(argument0, argument1, argument2, argument3) {
	__item = argument0;
	__posX = argument1;
	__posY = argument2;
	__code = argument3;

	if (__item = obj_block_qk){
	   __oldText = gms_ini_game_read("sign_text",global.planet_name+__code);
	   __newText = get_string("Edit sign text",__oldText);
	   __newText = string_copy(__newText,1,64);
	   gms_ini_game_write("sign_text",global.planet_name+__code,__newText);
	}



}
