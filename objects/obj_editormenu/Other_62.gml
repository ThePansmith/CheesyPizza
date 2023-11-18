live_auto_call;

if menu != 1 or state != 0
	exit;
if async_load[? "status"] != 0
	exit;
if async_load[? "id"] != request
	exit;

// listing
if state == 0
{
	sel.y = 0;

	var data = json_parse(async_load[? "result"]);
	if !variable_struct_exists(data, "_aRecords")
		exit;
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
		
		var base_image = this._aPreviewMedia._aImages[0];
		var struct = {
			name: this._sName,
			imagelink: base_image._sBaseUrl + base_image._sFile530,
			author: this._aSubmitter._sName,
			image: noone,
			modid: this._idRow,
			url: this._sProfileUrl,
			likes: likes,
			posts: posts,
			views: views
		}
		
		array_push(remote_towers, struct);
		fetch_tower_image(0);
	}

	// done
	state = 1;
}

// got download list
if state == 2
{
	
}
