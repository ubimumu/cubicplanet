/// @description Variables
mobile = true;
options = true;

target_zoom_w = 800;
target_zoom_h = target_zoom_w/2;
zoom_max_w = 1408;

///Create virtual keys
if (mobile = true){

   //vkey_punch = virtual_key_add(1088,576,128,128,vk_space);
   
   keyboard_set_map(vk_left,ord("A"));
   keyboard_set_map(vk_right,ord("D"));
   keyboard_set_map(vk_up,ord("W"));
}

