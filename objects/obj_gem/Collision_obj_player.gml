/// @description Collect
safe_ini_player_write("status","gems",safe_ini_player_read_real("status","gems") + 1);
sound_play(snd_complete);
instance_destroy();

