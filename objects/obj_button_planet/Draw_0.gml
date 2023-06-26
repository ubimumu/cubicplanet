/// @description Draw contents
draw_self();
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(fnt_big);
draw_set_color(c_white);
draw_text(sprite_width/2+x,sprite_height/2+y-1,string_hash_to_newline(hint));
draw_set_valign(0);
draw_set_halign(0);

