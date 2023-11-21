/// @description zip extraction
live_auto_call;

/*
if menu != 1
	exit;

for(var i = 0; i < array_length(downloads); i++)
{
	var this = downloads[i], tower = remote_towers[i];
	if this == noone
		continue;
	if async_load[? "id"] != downloads[i].request
		continue;
	
	file_delete(this.file.path);
	if async_load[? "status"] < 0
	{
		message_show($"Failed to extract a ZIP!");
		
		downloads[i] = noone;
		download_count--;
		break;
	}
	
	// attempt to find
	var target = filename_dir(this.file.path);
	
	_found = "";
	find_files_recursive(target, function(file)
	{
		_found = file;
		return true;
	}, ".tower.ini");
	
	if _found == ""
		message_show($"This mod is not a CYOP tower!");
	else
	{
		var finaltarget = towers_folder + $"\\{tower.modid}";
		folder_destroy(finaltarget);
		
		if folder_move(filename_dir(_found), finaltarget) == 0
			message_show("Couldn't move directory?");
		
		tower.downloaded = true;
		sound_play("event:/modded/sfx/downloaded");
		
		add_tower($"{finaltarget}\\{filename_name(_found)}", true);
	}
	folder_destroy(target); // using dll, deletes all files too
	
	downloads[i] = noone;
	download_count--;
	break;
}
*/
