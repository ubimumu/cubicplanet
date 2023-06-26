/// @description Initialize
name = "Password";
class = "password";
ini_open("save.ini");
text = ini_read_string("textbox_input",class,"");
ini_close();
focus = false;
crypt = true;

