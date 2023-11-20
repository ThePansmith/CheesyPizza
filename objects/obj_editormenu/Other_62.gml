live_auto_call;

if menu != 1
	exit;

// downloads
if array_length(remote_towers) > 0
{
	for(var i = 0; i < array_length(downloads); i++)
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
			array_sort(data, function(elm1, elm2)
			{
				// latest uploads first
				return elm1._tsDateAdded < elm2._tsDateAdded && string_ends_with(elm1._sFile, ".zip");
			});
			
			this.file = data[0];
			//show_message(this.file._sFile);
			
			if !string_ends_with(this.file._sFile, ".zip")
			{
				message_show($"This mod is not a CYOP tower!");
				
				downloads[i] = noone;
				download_count--;
				break;
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
				this.request = zip_unzip_async(this.file.path, filename_dir(this.file.path));
				this.state = 2;
				
				this.progress = 1;
			}
			else if async_load[? "status"] == 1
			{
				this.progress = async_load[? "sizeDownloaded"] / async_load[? "contentLength"];
				trace("Download: ", this.progress * 100, "%");
			}
			else
			{
				message_show("Could not download tower.");
				
				downloads[i] = noone;
				download_count--;
			}
		}
		exit;
	}
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
