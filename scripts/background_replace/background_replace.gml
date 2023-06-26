/// @description Replace a background resource with another one.
/// @param ind The index of the background to permanently replace.
/// @param fname The filename of the image to make the new background.
/// @param removeback Indicates whether to make all pixels with the same colour (left-bottom pixel) transparent.
/// @param smooth Indicates whether to smooth the edges.
/// @returns 
function background_replace(argument0, argument1, argument2, argument3) {

	sprite_replace(argument0, argument1, 1, argument2, argument3, 0, 0);


}
