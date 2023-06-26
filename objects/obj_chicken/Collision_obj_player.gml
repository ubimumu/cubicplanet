/// @description Collect
inventory_item_set("chicken",inventory_item_get("chicken") + 1);
sound_play(snd_complete);
message = "`2"+gms_self_name()+"`1 has caught a chicken!";
gms_p2p_send(3,gms_p2p_all_in_session,message);
instance_destroy();

