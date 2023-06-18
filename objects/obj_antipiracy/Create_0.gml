#region functions

failed_once = false;
open_file = function()
{
	var reader = ini_read_string("Modded", "steampath", "");
	if reader != "" && !file_exists(reader)
		show_message("You seem to have moved or uninstalled Pizza Tower.\nPlease reinstall it, and select the \"steam_api64.dll\" file again.");
	
	if failed_once or reader == "" or !file_exists(reader)
		return get_open_filename_ext("steam_api64.dll|steam_api64.dll|*.dll|*.dll", "", @"C:\Program Files\Steam\steamapps\common\Pizza Tower", "Verify your Pizza Tower installation");
	else
		return reader;
}
check = function(file)
{
	if file == ""
		return false;
	
	var PTdir = filename_dir(file);
	var PTfiles = ["data.win", "fmod.dll", "gameframe_x64.dll", @"sound\Desktop\Master.bank"];
	
	// steam_api64.dll
	if md5_file(file) != "500475b20083ccdc64f12d238cab687a"
	{
		show_message("Something went wrong.\n\nPlease choose the \"steam_api64.dll\" file in the folder where you installed Pizza Tower.");
		return false;
	}
	
	// Steamworks_x64.dll
	if md5_file(PTdir + @"\Steamworks_x64.dll") != "dddff8b3c67e40ba51ab322122f50f0a"
	{
		show_message("Something went wrong.\n\nPlease make sure you don't have any renamed or missing files in your Pizza Tower installation.\n\nRight click the game on your Steam library, click on \"Properties...\" at the bottom, go to Local Files and click the \"Verify integrity of game files...\" button.\n\nMake sure to back up your current modified install before doing this, because it will basically reinstall the game.");
		return false;
	}
	
	// check every misc. file
	for(var i = 0; i < array_length(PTfiles); i++)
	{
		if !file_exists(PTdir + @"\" + PTfiles[i])
		{
			show_message("Something went wrong.\n\nPlease make sure you don't have any renamed or missing files in your Pizza Tower installation.\n\nRight click the game on your Steam library, click on \"Properties...\" at the bottom, go to Local Files and click the \"Verify integrity of game files...\" button.\n\nMake sure to back up your current modified install before doing this, because it will basically reinstall the game.");
			return false;
		}
	}
	
	// the game must be located in "steamapps/common/Pizza Tower"
	if !string_ends_with(string_letters(PTdir), "steamappscommonPizzaTower")
	{
		show_message("Something went wrong.\nPlease make sure you have Pizza Tower installed on Steam.");
		return false;
	}
	
	return true;
}

#endregion

/*
ini_open("saveData.ini");

var file = "";
while !check(file)
{
	file = open_file();
	if file == ""
	{
		game_end();
		exit;
	}
	failed_once = true;
}

ini_write_string("Modded", "steampath", file);
ini_close();
*/

global.pastdisclaimer = true;
room_goto(Loadiingroom);
