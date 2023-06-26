/// @description Variables
icon = spr_block_00;
text = "Notification";
font = fnt_notification;
draw_set_font(font);
width = 128 + string_width(string_hash_to_newline(string_keywords_remove(text)));
pos = -width;
target_pos = pos;

