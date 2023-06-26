/// @description Draw self and break progress
texture_set_interpolation(false);
draw_sprite(sprite,0,x,y);
texture_set_interpolation(true);

if (break_progress > 0){
draw_sprite(spr_break,break_progress,x,y);
}

///Destroy if needed
if (global.destroy = self.code){
instance_destroy();
}

