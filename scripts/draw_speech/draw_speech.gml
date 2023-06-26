/// @description draw_speech(x,y,string,outline,fill)
/// @param x
/// @param y
/// @param string
/// @param outline
/// @param fill
function draw_speech(argument0, argument1, argument2, argument3, argument4) {
	_x = argument0; _y = argument1; 
	_string = argument2;
	_outline = argument3; _fill = argument4;
	if !(_string = ""){
	   draw_set_font(fnt_speech);
	   width = string_width(string_hash_to_newline(string_keywords_remove(_string)));
	   height = string_height(string_hash_to_newline(string_keywords_remove(_string)));
	   _half_width = width/2;
	   _x -= _half_width;
	   _y -= height;
	   draw_set_color(c_white);
	   draw_sprite_stretched(_outline,1,_x-4,_y-4,width+8,height+8);
	   draw_sprite_stretched(_fill,1,_x-2,_y-2,width+4,height+4);
	   draw_string(_x,_y,_string,c_white,false,fnt_speech);
	}



}
