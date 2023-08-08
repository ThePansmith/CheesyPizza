var load = get_open_filename_ext("CYOP Tower (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\", "Select a custom level");
if load == ""
{
	instance_destroy();
	exit;
}
cyop_load(load);
