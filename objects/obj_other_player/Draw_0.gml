/// @description Draw
draw_speech(x+16,y-48,message,spr_speech_outline,spr_speech);

if (invisible = true){return false}
if (invisible = false){drawable = string(username) + " `2" + string(level)}

if (player_health < 30){
   draw_sprite(spr_health_bar,0,x,y-32);
   draw_sprite_stretched(spr_health,0,x,y-32,player_health,5);
}

if (dead = false){
   if (skin = 1){draw_character_brown()}
   if (skin = 2){draw_character()}
   if (skin = 3){draw_character_white()}
   if (skin = 4){draw_character_invisible()}
   if (skin = 5){draw_character_ghost()}
}

draw_set_font(fnt_default);
draw_string(x+24,y-15,string_keywords_remove(drawable),c_black,true,fnt_default);
draw_string(x+24,y-17,string_keywords_remove(drawable),c_black,true,fnt_default);
draw_string(x+23,y-16,string_keywords_remove(drawable),c_black,true,fnt_default);
draw_string(x+25,y-16,string_keywords_remove(drawable),c_black,true,fnt_default);
draw_string(x+24,y-16,drawable,c_white,true,fnt_default);
str_w = string_width(string_hash_to_newline(string_keywords_remove(drawable)))/2;
draw_flag(x+8-str_w,y-22,region);

