/// @description Draw block shadows
texture_set_interpolation(false);

with par_block {
   draw_sprite_ext(sprite,0,x+4,y+4,1,1,0,c_black,0.5);
}

with par_deco {
   draw_sprite_ext(sprite,0,x+4,y+4,1,1,0,c_black,0.5);
}

texture_set_interpolation(true);

