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

///Draw sign text
if (collision_rectangle(x,y,x+32,y+32,obj_player,true,true)){
draw_speech(x+16,y-16,gms_ini_game_read("sign_text",global.planet_name+code),spr_speech_outline,spr_speech);
}

