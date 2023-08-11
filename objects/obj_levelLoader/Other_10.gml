/// @description debug load level
var load = get_open_filename_ext("CYOP Tower (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\", "Select a custom level");
if load == ""
	exit;
cyop_cleanup();

var result = cyop_load(load);
if is_string(result)
{
	show_message(result);
	exit;
}
loaded = true;
