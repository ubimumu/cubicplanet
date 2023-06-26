/// @description show_options(name,title,option1,option2,option3)
/// @param name
/// @param title
/// @param option1
/// @param option2
/// @param option3
function show_options(argument0, argument1, argument2, argument3, argument4) {
	if !(instance_exists(obj_options)){
	   instance_create(0,0,obj_options);
	   obj_options.name = argument0;
	   obj_options.title = argument1;
	   obj_options.opt1 = argument2;
	   obj_options.opt2 = argument3;
	   obj_options.opt3 = argument4;
	}



}
