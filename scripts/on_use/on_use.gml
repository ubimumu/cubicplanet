/// @description on_use(id)
/// @param id
function on_use(argument0) {

	if (argument0 = "obj_block_qj"){
	   if (inventory_item_get("obj_block_qj") > 99){
	      inventory_item_set("obj_block_qj",inventory_item_get("obj_block_qj") - 100);
	      inventory_item_set("obj_block_wr",inventory_item_get("obj_block_wr") + 1);
	      chat_add("You exchanged `2100 Planet locks `1into `21 Crystal lock`1.");
	      return false;
	   }
	   if (inventory_item_get("obj_block_qj") > 9){
	      inventory_item_set("obj_block_qj",inventory_item_get("obj_block_qj") - 10);
	      inventory_item_set("obj_block_qc",inventory_item_get("obj_block_qc") + 1);
	      chat_add("You exchanged `210 Planet locks `1into `21 Ruby lock`1.");
	      return false;
	   }
	   chat_add("Not enough items to exchange.");
	}

	if (argument0 = "obj_block_qc"){
	   inventory_item_set("obj_block_qc",inventory_item_get("obj_block_qc") - 1);
	   inventory_item_set("obj_block_qj",inventory_item_get("obj_block_qj") + 10);
	   chat_add("You exchanged `21 Ruby lock `1into `210 Planet locks`1.");
	   if (inventory_item_get("obj_block_qc") < 1){
	      obj_inventory.selection = 1;
	      obj_inventory.item = "break_tool";
	   }
	   return false;
	}

	if (argument0 = "obj_block_wr"){
	   inventory_item_set("obj_block_wr",inventory_item_get("obj_block_wr") - 1);
	   inventory_item_set("obj_block_qj",inventory_item_get("obj_block_qj") + 100);
	   chat_add("You exchanged `21 Crystal lock `1into `2100 Planet locks`1.");
	   if (inventory_item_get("obj_block_wr") < 1){
	      obj_inventory.selection = 1;
	      obj_inventory.item = "break_tool";
	   }
	   return false;
	}
   
	on_wear(argument0);



}
