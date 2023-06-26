/// @description Draw friends
draw_self();
pos = 48;
current = 1;
repeat(25){
   draw_set_color(c_white); draw_set_font(fnt_default);
   drawable = string_keywords_validate(string(friends[? string(current)]));
   draw_text_colored(x+16,y+pos,drawable,1);
   status_width = string_width(string_hash_to_newline(string_keywords_remove(string(status[? string(current)]))));
   drawable = string_keywords_validate(string(status[? string(current)]));
   draw_text_colored(x+368-status_width,y+pos,drawable,1);
   pos += 16; current += 1;
}

