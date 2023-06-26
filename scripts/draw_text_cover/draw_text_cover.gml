/// @description draw_text_cover(x,y,text)
/// @param x
/// @param y
/// @param text
function draw_text_cover(argument0, argument1, argument2) {
	draw_set_font(fnt_medium);
	draw_set_color(c_white);
	width = string_width(string_hash_to_newline(argument2));
	height = string_height(string_hash_to_newline(argument2));
	argument0 -= width/2;
	argument1 -= height/2;
	draw_sprite_stretched(spr_text_cover,0,argument0-4,argument1-4,width+8,height+8);
	draw_text(argument0,argument1,string_hash_to_newline(argument2));



}
