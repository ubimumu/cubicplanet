/// @description Buzzsaw script
if (collision_rectangle(x-1,y-1,x+33,y+33,obj_player,true,true)){
   obj_player.player_health -= 15;
}

