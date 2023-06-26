/// @description Draw self
if (checked = false){draw_sprite(sprite_index,0,x,y)}
if (checked = true){draw_sprite(sprite_index,1,x,y)}

///Draw checkbox name
draw_set_valign(fa_center);
draw_set_font(fnt_default);
draw_set_color(c_white);
draw_text(x+48,y+16,string_hash_to_newline(name));
draw_set_valign(0);

