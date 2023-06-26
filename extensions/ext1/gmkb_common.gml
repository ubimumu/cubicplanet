#define gmkb_init_common
global.gmkb_char_sprites = ds_map_create();

#define gmkb_char_get_sprite
// gmkb_char_get_sprite(char, font_size)
var char = argument[0];
var font_size = argument[1];
var map_key = char + "_" + string(font_size);
var sprite = -1;
var map_exists = false;
if (ds_map_exists(global.gmkb_char_sprites, map_key)) {
    map_exists = true;
    sprite = ds_map_find_value(global.gmkb_char_sprites, map_key);
}
if (!sprite_exists(sprite)) {
    var image = gmkb_char_get_image(char, font_size);
    if (image != "") {
      sprite = sprite_add(game_save_id + image, 0, 0, 0, 0, 0);
      if (map_exists) {
          ds_map_replace(global.gmkb_char_sprites, map_key, sprite);
      }
      else {
          ds_map_add(global.gmkb_char_sprites, map_key, sprite);
      }
    }
}
return sprite;

#define gmkb_string_get_chars
// gmkb_string_get_chars(str, font, emoji_font_size, width, word_wrap)
// Returns a list for the lines of text. For no wrap, use -1 for the width.
// Each line is a list for the characters in the line. Each character is a map containing the following keys:
//  character: the character
//  width: its width
//  sprite: if emoji, its sprite (otherwise -1)
var str = argument[0];
var font = argument[1];
var emoji_font_size = argument[2];
var width = argument[3];
var word_wrap = argument[4];
var list = ds_list_create();
draw_set_font(font);
var str_length = gmkb_string_get_length(str);
var count = 0;
var word_width = 0;
var line_width = 0;
var line_chars = ds_list_create();
var char;
var last_char;
var last_char_was_space = false;
var last_char_was_line_break = false;
var add_chars_to_line_on_next_iteration = false;
var chars_to_add = ds_list_create();
while (1) {
    if (count > 0) {
        if (add_chars_to_line_on_next_iteration) {
            for (var n = 0; n < ds_list_size(chars_to_add); n++) {
                var this_char = ds_list_find_value(chars_to_add, n);
                ds_list_add(line_chars, this_char);
            }
            ds_list_clear(chars_to_add);
            add_chars_to_line_on_next_iteration = false;
        }
        ds_list_add(chars_to_add, last_char);
    }
    count ++;
    var finished = false;
    var word_will_continue_on_next_line = false;
    var char_will_be_on_next_word = false;
    var word_will_be_on_next_line = false;
    var char_will_be_on_next_line = false;
    if (count > str_length) {
        finished = true;
    }
    else {
        char = ds_map_create();
        var char_character = gmkb_string_char_at(str, count - 1);
        var char_is_line_break = false;
        var char_is_space = false;
        var char_is_emoji = gmkb_char_is_emoji(char_character);
        var char_width = 0;
        var char_sprite = -1;
        if (char_is_emoji) {
            char_sprite = gmkb_char_get_sprite(char_character, emoji_font_size);
            char_width = sprite_get_width(char_sprite);
        }
        else {
            var char_code = ord(char_character);
            if (char_code == 10 || char_code == 13) {
                char_is_line_break = true;
            }
            else {
                if (char_character == " ") {
                    char_is_space = true;
                }
                if (char_character == "#") {
                    char_character = "\\#";
                }
                char_width = string_width(string_hash_to_newline(char_character));
            }
        }
        var char_fits_on_line = (line_width + word_width + char_width <= width || width < 0);
        word_will_continue_on_next_line = (word_width + char_width > width && width >= 0);
        char_will_be_on_next_word = (!word_wrap || char_is_space || last_char_was_space || char_is_line_break || last_char_was_line_break);
        word_will_be_on_next_line = (!word_will_continue_on_next_line && !char_will_be_on_next_word && !char_fits_on_line);
        char_will_be_on_next_line = (!word_will_be_on_next_line && (word_will_continue_on_next_line || !char_fits_on_line || char_is_line_break));
        add_chars_to_line_on_next_iteration = (char_will_be_on_next_word || word_will_be_on_next_line);
        if (char_will_be_on_next_line && char_is_space) {
            char_width = 0;
        }
        if (char_will_be_on_next_word) {
            line_width += word_width;
            word_width = 0;
        }
        if (char_will_be_on_next_line) {
            word_width = 0;
        }
        word_width += char_width;
        ds_map_add(char, "character", char_character);
        ds_map_add(char, "width", char_width);
        ds_map_add(char, "sprite", char_sprite);
        last_char = char;
        last_char_was_space = char_is_space;
        last_char_was_line_break = char_is_line_break;
    }
    var save_current_line = (word_will_be_on_next_line || char_will_be_on_next_line || finished);
    if (save_current_line) {
        if (!word_will_be_on_next_line) {
            for (var n = 0; n < ds_list_size(chars_to_add); n++) {
                var this_char = ds_list_find_value(chars_to_add, n);
                ds_list_add(line_chars, this_char);
            }
            ds_list_clear(chars_to_add);
        }
        ds_list_add(list, line_chars);
        if (!finished) {
            line_width = 0;
            line_chars = ds_list_create();
        }
    }
    if (finished) {
        break;
    }
}
return list;

