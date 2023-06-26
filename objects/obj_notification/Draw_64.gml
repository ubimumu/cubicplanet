/// @description Control
draw_set_font(font);
width = 128 + string_width(string_hash_to_newline(string_keywords_remove(text)));
pos = lerp(pos, target_pos, .3);

///Draw notification
draw_set_font(font);
draw_set_valign(fa_center);
draw_sprite_stretched(spr_notification,0,pos,32,width,96);
draw_sprite_stretched(icon,0,pos+16,48,64,64);
draw_text_colored(pos+96,80,string_keywords_validate(text),1);
draw_set_valign(0);

