/// @description Drop gems
gems = 10;
repeat(irandom(gems)){
instance_create(x+irandom(16),y+irandom(16),obj_gem);
}

