/// @description on_option(name,option)
/// @param name
/// @param option
function on_option(argument0, argument1) {
	name = string(argument0);
	option = real(argument1);

	if (name = "planet"){
	   if (option = 1){
	      planet_leave();
	   }
	   if (option = 2){
	      planet_restart();
	      instance_destroy();
	   }
	   if (option = 3){
	      instance_destroy();
	   }
	}



}
