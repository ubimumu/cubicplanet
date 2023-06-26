/// @description Race finish flag script
if (obj_world.race = true){
   obj_world.race = false;
   gms_p2p_send(3,gms_p2p_all_in_session,"`2"+gms_self_name()+"`1 has finished at `2"+string(current_minute)+":"+string(current_second)+"`1!");
}

