/// @description Platform script
if (obj_player.y + 32 > y){
  sprite_index = -1;
} 
if !(obj_player.y + 32 > y){
  sprite_index = spr_block;
}

