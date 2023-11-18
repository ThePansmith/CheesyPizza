function sh_cyop()
{
	instance_create_unique(obj_levelLoader);
	with obj_levelLoader
	{
		var load = get_open_filename_ext("CYOP Tower (*.tower.ini)|*.tower.ini|INI file (*.ini)|*.ini", "", environment_get_variable("APPDATA") + "\\PizzaTower_GM2\\towers\\", "Select a custom level");
		if load == ""
			exit;
		cyop_cleanup();
		
		var result = cyop_load(load);
		if is_string(result)
		{
			show_message(result);
			if !loaded
				instance_destroy();
		}
		else
			loaded = true;
	}
}
function meta_cyop()
{
	return
	{
		description: ""
	}
}
