/// @description Draw contents
draw_self();
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(fnt_big);
draw_set_color(c_white);
draw_text(sprite_width/2+x,sprite_height/2+y-1,string_hash_to_newline(hint));
draw_set_valign(0);
draw_set_halign(0);

///Draw spinner
if (loading = true){
   draw_sprite_stretched(spr_shadow,0,0,0,1408,800);
   draw_sprite_ext(spr_loading,0,704,400,1,1,rot,c_white,1);
   rot -= 3;
}

