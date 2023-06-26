/// @description Initialize
name = "Planet name";
class = "planet";
ini_open("save.ini");
text = ini_read_string("textbox_input",class,"");
ini_close();
focus = false;
crypt = false;

