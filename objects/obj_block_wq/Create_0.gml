/// @description Variables / align
move_snap(32,32);
break_progress = 0;
break_speed = 0.20 + global.weapon_power;
code = "deco_x"+string(x)+"y"+string(y);
broken = false;

sprite_index = spr_block;
sprite = object_get_name(object_index);
sprite = string_replace(sprite,"obj","spr");
sprite = asset_get_index(sprite);

