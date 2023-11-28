live_auto_call;

if menu != 1
	exit;
done_download = function(i)
{
	downloads[i] = noone;
	download_count--;
}

// downloads
for(var i = 0; i < array_length(downloads) && i < array_length(remote_towers); i++)
{
	var this = downloads[i], tower = remote_towers[i];
	if downloads[i] == noone
		continue;
	if async_load[? "id"] != this.request
		continue;
	
	// got download list
	if this.state == 0
	{
		var data = json_parse(async_load[? "result"]);
		if !is_array(data) or array_length(data) == 0
		{
			message_show("Gamebanana messed up! Try again!");
			done_download(i);
			exit;
		}
			
		array_sort(data, function(elm1, elm2)
		{
			// latest uploads first
			return elm1._tsDateAdded < elm2._tsDateAdded && string_ends_with(elm1._sFile, ".zip");
		});
			
		this.file = data[0];
		//show_message(this.file);
			
		if !string_ends_with(this.file._sFile, ".zip")
		{
			tower.corrupt = true;
			if string_ends_with(this.file._sFile, ".rar")
				message_show($"Can't extract .rar mods!");
			else if string_ends_with(this.file._sFile, ".json")
				message_show($"Not a tower!");
			else
				message_show($"Unknown format {filename_ext(this.file._sFile)}!");
			done_download(i);
			exit;
		}
			
		this.file.path = $"{towers_folder}\\temp_{tower.modid}\\download.zip";
		this.request = http_get_file(this.file._sDownloadUrl, this.file.path);
		this.state = 1;
	}
		
	// download progress
	else if this.state == 1
	{
		if async_load[? "status"] == 0
		{
			// finished downloading
			this.file.path = async_load[? "result"];
			this.request = zip_unzip(this.file.path, filename_dir(this.file.path));
			this.state = 2;
			this.progress = 1;
				
			// moved from async, because gamemaker was bugging
			file_delete(this.file.path);
			if this.request < 0
			{
				message_show($"Failed to extract a ZIP!");
				done_download(i);
				exit;
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
			done_download(i);
		}
		else if async_load[? "status"] == 1
		{
			this.progress = async_load[? "sizeDownloaded"] / async_load[? "contentLength"];
			trace("Download: ", this.progress * 100, "%");
		}
		else
		{
			message_show("Could not download tower.");
			done_download(i);
		}
	}
	exit;
}

// listing
if async_load[? "status"] != 0
	exit;
if async_load[? "id"] != request
	exit;

if state == 0
{
	sel.y = -1;
	
	var data = json_parse(async_load[? "result"]);
	if !variable_struct_exists(data, "_aRecords") or array_length(data._aRecords) == 0
	{
		message_show("Page not found!");
		state = 1;
		exit;
	}
	last_page = data._aMetadata._bIsComplete;
	
	for(var i = 0; i < array_length(data._aRecords); i++)
	{
		var this = data._aRecords[i];
		if this._idRow == 450677 // Working Boss Controller for Cyop
		or this._idRow == 470390 // cyop custom FMOD events
		or this._idRow == 448568 // Lap Heck Mod for CYOP
			continue;
		
		var likes = 0, posts = 0, views = 0;
		if variable_struct_exists(this, "_nLikeCount")
			likes = this._nLikeCount;
		if variable_struct_exists(this, "_nPostCount")
			posts = this._nPostCount;
		if variable_struct_exists(this, "_nViewCount")
			views = this._nViewCount;
		
		var name = this._sName;
		if string_pos("cyop", string_lower(name)) != 0
		{
			name = string_replace(name, "(cyop)", "");
			name = string_replace(name, "(CYOP)", "");
			name = string_replace(name, "(Cyop)", "");
			name = string_replace(name, "[CYOP]", "");
			name = string_replace(name, "(CYOP Level)", "");
			name = string_replace(name, "(CYOP level)", "");
			name = string_replace(name, "(CYOP Tower)", "");
			name = string_replace(name, "(CYOP tower)", "");
			name = string_replace(name, "CYOP, ", "");
			name = string_replace(name, "CYOP: ", "");
		}
		name = string_trim(name);
		
		var downloaded = false;
		if directory_exists($"{towers_folder}\\{this._idRow}")
			downloaded = true;
		
		var base_image = this._aPreviewMedia._aImages[0];
		var struct = {
			name: name,
			imagelink: base_image._sBaseUrl + "/" + base_image._sFile530,
			author: this._aSubmitter._sName,
			image: noone,
			modid: this._idRow,
			url: this._sProfileUrl,
			likes: likes,
			posts: posts,
			views: views,
			downloaded: downloaded,
			corrupt: false
		}
		
		array_push(remote_towers, struct);
		fetch_tower_image(array_length(remote_towers) - 1);
	}

	// done
	state = 1;
}
