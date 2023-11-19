live_auto_call;

if menu != 1 or state == 1
	exit;
if async_load[? "status"] != 0
	exit;
if async_load[? "id"] != request
	exit;

// listing
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
		
		var likes = 0, posts = 0, views = 0;
		if variable_struct_exists(this, "_nLikeCount")
			likes = this._nLikeCount;
		if variable_struct_exists(this, "_nPostCount")
			posts = this._nPostCount;
		if variable_struct_exists(this, "_nViewCount")
			views = this._nViewCount;
		
		var name = this._sName;
		name = string_replace(name, "(cyop)", "");
		name = string_replace(name, "(CYOP)", "");
		name = string_replace(name, "[CYOP]", "");
		name = string_replace(name, "(CYOP Level)", "");
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
			downloaded: downloaded
		}
		
		array_push(remote_towers, struct);
		fetch_tower_image(array_length(remote_towers) - 1);
	}

	// done
	state = 1;
}

// got download list
if state == 2
{
	var this = remote_towers[download_index];
	var data = json_parse(async_load[? "result"]);
	array_sort(data, function(elm1, elm2)
	{
		// latest uploads first
		return elm1._tsDateAdded >= elm2._tsDateAdded && string_ends_with(elm1._sFile, ".zip");
	});
	
	download_file = data[0];
	if !string_ends_with(download_file._sFile, ".zip")
	{
		state = 1;
		exit;
	}
	
	download_file.path = $"{towers_folder}\\temp{this.modid}\\{this.modid}.zip";
	request = http_get_file(download_file._sDownloadUrl, download_file.path);
	state = 3;
	exit;
}

// download progress
if state == 3
{
	if async_load[? "status"] == 0
	{
		// finished downloading
		var zipfile = async_load[? "result"];
		var this = remote_towers[download_index];
		var target = $"{towers_folder}\\temp{this.modid}";
		
		var unzip = zip_unzip(zipfile, target);
		file_delete(zipfile);
		
		if unzip <= 0
		{
			state = 1;
			show_message("Failed extracting ZIP");
			exit;
		}
		
		// attempt to find
		_found = "";
		find_files_recursive(target, function(file)
		{
			_found = file;
			return true;
		}, ".tower.ini");
		
		if _found == ""
		{
			state = 1;
			show_message("Download does not contain a level");
			folder_destroy(target); // using dll, deletes all files too
		}
		else
		{
			var finaltarget = towers_folder + $"\\{this.modid}";
			folder_destroy(finaltarget);
			if folder_move(filename_dir(_found), finaltarget) == 0
				show_message("Couldn't move directory");
			folder_destroy(target);
			this.downloaded = true;
			state = 1;
		}
	}
	else if async_load[? "status"] == 1
	{
		download_progress = async_load[? "sizeDownloaded"] / async_load[? "contentLength"];
		trace(download_progress);
	}
	else
	{
		state = 1;
		show_message("Failed downloading");
	}
}
