/// @description Give reward
safe_ini_player_write("status","gems",safe_ini_player_read_real("status","gems") + 100);
show_notification(spr_gem_icon,"Received`2 100 `1gems!");
loading = false;

