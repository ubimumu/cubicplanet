/// @description Draw options
draw_sprite(spr_options,1,posX,posY);
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_font(fnt_big);
draw_set_color(c_black);
draw_text(posX+161,posY+20,string_hash_to_newline(title));
draw_text(posX+159,posY+20,string_hash_to_newline(title));
draw_text(posX+160,posY+21,string_hash_to_newline(title));
draw_text(posX+160,posY+19,string_hash_to_newline(title));
draw_set_color(c_white);
draw_text(posX+160,posY+20,string_hash_to_newline(title));

draw_text(posX+160,posY+91,string_hash_to_newline(opt1));
draw_text(posX+160,posY+159,string_hash_to_newline(opt2));
draw_text(posX+160,posY+227,string_hash_to_newline(opt3));


draw_set_valign(0);
draw_set_halign(0);

