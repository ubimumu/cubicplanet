/// @description Draw messages
draw_set_color(c_white);
draw_set_font(fnt_default);
if (typing = true){
   draw_sprite(spr_input,1,240,p+256);
   draw_text_colored(264,p+256,string_keywords_validate(gmkb_get_text()),1);
   a = 32;
}
if (typing = false){
   a = 0;
}
draw_sprite(spr_chat,1,208,p-a);
draw_text_colored(216,p+260-a,string_keywords_validate(messages[? "1"]),1);
draw_text_colored(216,p+240-a,string_keywords_validate(messages[? "2"]),1);
draw_text_colored(216,p+220-a,string_keywords_validate(messages[? "3"]),1);
draw_text_colored(216,p+200-a,string_keywords_validate(messages[? "4"]),1);
draw_text_colored(216,p+180-a,string_keywords_validate(messages[? "5"]),1);
draw_text_colored(216,p+160-a,string_keywords_validate(messages[? "6"]),1);
draw_text_colored(216,p+140-a,string_keywords_validate(messages[? "7"]),1);
draw_text_colored(216,p+120-a,string_keywords_validate(messages[? "8"]),1);
draw_text_colored(216,p+100-a,string_keywords_validate(messages[? "9"]),1);
draw_text_colored(216,p+80-a,string_keywords_validate(messages[? "10"]),1);
draw_text_colored(216,p+60-a,string_keywords_validate(messages[? "11"]),1);
draw_text_colored(216,p+40-a,string_keywords_validate(messages[? "12"]),1);
draw_text_colored(216,p+20-a,string_keywords_validate(messages[? "13"]),1);
draw_text_colored(216,p+0-a,string_keywords_validate(messages[? "14"]),1);

///Drag proccess
draw_sprite(spr_drag,1,dragPosX,dragPosY);

gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);

if (point_in_rectangle(gui_mouse_x,gui_mouse_y,dragPosX-64,dragPosY-32,dragPosX+64,dragPosY+32)and mouse_check_button(mb_left)){
   dragPosY = gui_mouse_y;
}

if (dragPosY < dragPosYmin){dragPosY = dragPosYmin}
if (dragPosY > dragPosYmax){dragPosY = dragPosYmax}

p = dragPosY - 304;

