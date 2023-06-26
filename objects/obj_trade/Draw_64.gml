/// @description Draw
draw_set_color(c_white);

draw_sprite(spr_form_trade_self,1,16,384);
on_item_draw(48,448,item1,string(item1count));
on_item_draw(112,448,item2,string(item2count));
on_item_draw(176,448,item3,string(item3count));
on_item_draw(240,448,item4,string(item4count));

draw_sprite(spr_form_trade_other,1,1072,384);
on_item_draw(1104,448,otheritem1,string(otheritem1count));
on_item_draw(1168,448,otheritem2,string(otheritem2count));
on_item_draw(1232,448,otheritem3,string(otheritem3count));
on_item_draw(1296,448,otheritem4,string(otheritem4count));

