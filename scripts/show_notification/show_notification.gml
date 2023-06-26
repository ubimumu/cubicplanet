/// @description show_notification(icon,text)
/// @param icon
/// @param text
function show_notification(argument0, argument1) {
	target_icon = argument0;
	target_text = argument1;

	if (instance_exists(obj_notification)){
	   obj_notification.icon = target_icon;
	   obj_notification.text = target_text;
	   obj_notification.alarm[0] = 1;
	}



}
