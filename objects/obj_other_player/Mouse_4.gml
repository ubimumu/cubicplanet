/// @description Hit other player
damage = irandom(10);
gms_p2p_send(24,player_id,damage,gms_self_name());
on_level(50);

