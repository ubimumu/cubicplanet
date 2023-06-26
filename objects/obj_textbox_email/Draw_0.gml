/// @description Draw
draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_big);

if (text = ""){
   draw_set_color(c_silver);
   draw_text(x+128,y+24,string_hash_to_newline(name));
}
if (!text = ""){
   if (crypt = false){
      draw_set_color(c_white);
      visualString = text;
      strLength = string_length(text);
      visualString = string_copy(visualString,strLength-10,strLength);
      draw_text(x+128,y+24,string_hash_to_newline(visualString));
   }
   if (crypt = true){
      draw_set_color(c_white);
      visualString = "**********";
      visualString = string_copy(visualString,1,string_length(text));
      draw_text(x+128,y+24,string_hash_to_newline(visualString));
   }
}

draw_set_halign(0);
draw_set_valign(0);

