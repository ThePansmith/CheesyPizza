if alarm[1] > -1
	exit;

scr_menu_getinput();

var _dvc = obj_inputAssigner.player_input_device[0]

if -key_left2
    select = 0;
else if key_right2
    select = 1;

if key_jump
{
    if select == 0
    {
		// confirm
		if restart
		{
			ini_open_from_string(obj_savesystem.ini_str_options);
	        ini_write_real(section, key, saveto);
	        obj_savesystem.ini_str_options = ini_close();
			gamesave_async_save_options();
			
			// boot up
			if GM_build_type == "run"
			{
				show_message("Rebooting the game doesn't work while testing.\nThe setting HAS been saved, though.");
				instance_destroy();
			}
			else
			{
				if file_exists("CheesyPizza.exe")
				{
					launch_external("CheesyPizza.exe");
					alarm[1] = 5;
				}
				else
				{
					show_message("The mod's executable wasn't found.\nPlease reboot the game yourself to see any changes.");
					instance_destroy();
				}
			}
		}
		else
		{
	        ini_open_from_string(obj_savesystem.ini_str_options);
	        ini_write_real(section, key, variable_global_get(varname));
	        obj_savesystem.ini_str_options = ini_close();
	        timer = 5;
	        instance_destroy();
		}
    }
    else
    {
		// cancel
        timer = 0;
        event_perform(ev_alarm, 0);
        instance_destroy();
    }
}
