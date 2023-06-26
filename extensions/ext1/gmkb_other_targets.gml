#define gmkb_init
global.gmkb_returnKeyFunctionality = true;
global.gmkb_keyboardIsVisible = false;
global.gmkb_keyboardDidHide = false;
global.gmkb_lastKeyboardString = "";

#define gmkb_show_keyboard
gmkb_show_keyboard_ext(GMKB_TYPE_DEFAULT,GMKB_RK_TYPE_NEXT,GMKB_APPEARANCE_LIGHT,GMKB_CAPITALIZE_SENTENCES,false,false,false);

#define gmkb_show_keyboard_type
gmkb_show_keyboard_ext(argument[0], argument[1], GMKB_APPEARANCE_LIGHT, GMKB_CAPITALIZE_SENTENCES, false, false);

#define gmkb_show_keyboard_ext
global.gmkb_returnKeyFunctionality = argument[5];
global.gmkb_keyboardIsVisible = true;
global.gmkb_keyboardDidHide = false;

#define gmkb_hide_keyboard
global.gmkb_keyboardIsVisible = false;
global.gmkb_keyboardDidHide = true;

#define gmkb_keyboard_is_visible
return global.gmkb_keyboardIsVisible;

#define gmkb_keyboard_did_hide
if (global.gmkb_keyboardDidHide) {
    global.gmkb_keyboardDidHide = false;
    return true;
}
return false;

#define gmkb_keyboard_get_height
return 0;

#define gmkb_set_text
keyboard_string = argument[0];

#define gmkb_get_text
return keyboard_string;

#define gmkb_get_last_char
return keyboard_lastchar;

#define gmkb_text_did_change
if (global.gmkb_returnKeyFunctionality && keyboard_check_pressed(vk_enter)) {
    keyboard_string += chr(10);
}
if (keyboard_string != global.gmkb_lastKeyboardString) {
    global.gmkb_lastKeyboardString = keyboard_string;
    return true;
}
return false;

#define gmkb_key_was_pressed
return keyboard_check_pressed(vk_anykey);

#define gmkb_return_key_was_pressed
return keyboard_check_pressed(vk_enter);

#define gmkb_backspace_key_was_pressed
return keyboard_check_pressed(vk_backspace);

#define gmkb_language_did_change
return false;

#define gmkb_get_language
return "";

#define gmkb_get_input_method
return "";

#define gmkb_string_get_length
return string_length(argument[0]);

#define gmkb_string_char_at
return string_char_at(argument[0], argument[1] + 1);

#define gmkb_string_copy
return string_copy(argument[0], argument[1] + 1, argument[2]);

#define gmkb_char_is_emoji
return false;

#define gmkb_char_get_image
return "";

#define gmkb_clipboard_set
clipboard_set_text(argument[0]);

#define gmkb_clipboard_get
return clipboard_get_text();

