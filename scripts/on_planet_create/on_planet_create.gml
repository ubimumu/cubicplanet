/// @description on_planet_create(handle)
/// @param handle
function on_planet_create(argument0) {
	var handle = argument0;
	gms_bdb_seek(handle,0);

	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");
	gms_bdb_write(handle,bdb_string,"");

	//Blocks layer
	repeat(22)
	{
	gms_bdb_write(handle,bdb_string, "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
	}
	gms_bdb_write(handle,bdb_string, "00000000000000000000000000000000000000000000000000qq00000000000000000000000000000000000000000000");
	gms_bdb_write(handle,bdb_string, "qrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqrqr");
	gms_bdb_write(handle,bdb_string, "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw");
	gms_bdb_write(handle,bdb_string, "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw");
	gms_bdb_write(handle,bdb_string, "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw");
	gms_bdb_write(handle,bdb_string, "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw");
	gms_bdb_write(handle,bdb_string, "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw");
	gms_bdb_write(handle,bdb_string, "qwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqwqw");
	gms_bdb_write(handle,bdb_string, "wpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwpwp");
	gms_bdb_write(handle,bdb_string, "qeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqeqe");

	//Walls layer
	repeat(23)
	{
	gms_bdb_write(handle,bdb_string, "000000000000000000000000000000000000000000000000");
	}
	gms_bdb_write(handle,bdb_string, "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	gms_bdb_write(handle,bdb_string, "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");

	gms_bdb_close(handle);

	show_notification(spr_warning,"Planet created successfully!");



}
