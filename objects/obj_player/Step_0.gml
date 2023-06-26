/// @description Movements
   if !(obj_chat.typing = true) and
   !(instance_exists(obj_options)) and
   !(dead = true){
      key_right = keyboard_check(ord("D"));
      key_left = -keyboard_check(ord("A"));
      key_jump = keyboard_check_pressed(ord("W"));
      if keyboard_check_released(ord("W")) {grav = 10;}
      if key_jump {grav = 1;}
      if key_jump{sound_play(snd_jump)}
   }

   move = key_left + key_right;
   hsp = move * movespeed;
   if (vsp < 10) vsp += grav;
 
   if (place_meeting(target_x,target_y+1,par_block))
   {
       vsp = key_jump * -jumpspeed
   }

   if (place_meeting(target_x+hsp,target_y,par_block))
   {
       while(!place_meeting(target_x+sign(hsp),target_y,par_block))
       {
           target_x += sign(hsp);
       }
       hsp = 0;
   }
   target_x += hsp;

   if (place_meeting(target_x,target_y+vsp,par_block))
   {
      while(!place_meeting(target_x,target_y+sign(vsp),par_block))
      {
         target_y += sign(vsp);
      }
      vsp = 0;
   }
   target_y += vsp;
   
  // var platform = instance_place(target_x, target_y, par_wall);
   //if (platform){
   //   target_y = platform.y;
   //   if (vsp > 0){vsp = 0}
 //  }
 


///Variables
gms_self_set("player_health",player_health);
gms_self_set("username",username);
gms_self_set("message",message);
gms_self_set("region",region);
gms_self_set("invisible",invisible);
gms_self_set("skin",skin);
gms_self_set("level",level);
gms_self_set("hsp",hsp);
gms_self_set("vsp",vsp);
gms_self_set("hand_1",hand_1);
gms_self_set("hand_2",hand_2);
gms_self_set("facing",facing);
gms_self_set("leg",leg);
gms_self_set("dead",dead);
gms_self_set("hat_left",hat_left);
gms_self_set("hat_right",hat_right);
gms_self_set("face_left",face_left);
gms_self_set("face_right",face_right);
gms_self_set("body_left",body_left);
gms_self_set("body_hand_left",body_hand_left);
gms_self_set("body_right",body_right);
gms_self_set("body_hand_right",body_hand_right);
gms_self_set("hand_left",hand_left);
gms_self_set("hand_right",hand_right);
gms_self_set("leg1_left",leg1_left);
gms_self_set("leg1_right",leg1_right);
gms_self_set("leg2_left",leg2_left);
gms_self_set("leg2_right",leg2_right);
gms_self_set("pants_left",pants_left);
gms_self_set("pants_right",pants_right);
gms_self_set("back_left",back_left);
gms_self_set("back_right",back_right);

hand_1 = lerp(hand_1,target_hand_1,.2);
hand_2 = lerp(hand_2,target_hand_2,.2);
x = lerp(x,target_x,0.3);
y = lerp(y,target_y,0.5);

if !(hsp = 0){
   if (hand_1 < -30){target_hand_1 = 40}
   if (hand_1 > 30){target_hand_1 = -40}
   if (hand_2 < -30){target_hand_2 = 40}
   if (hand_2 > 30){target_hand_2 = -40}
}

if (hsp < 0){facing = 0}
if (hsp > 0){facing = 1}

level = safe_ini_player_read_string("status","level");

///Health
if (player_health < 0){
   planet_restart();
}

