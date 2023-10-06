if ds_map_find_value(async_load, "id") != req
	exit;
if ds_map_find_value(async_load, "status") != 0
{
	message_show($"HTTP STATUS {ds_map_find_value(async_load, "http_status")}!");
	exit;
}
loading = false;

var json_string = ds_map_find_value(async_load, "result");
var json = json_parse(json_string);

try
{
	// if you wanna add a version check, just add "version": "1.1"
	if variable_struct_exists(json, "version") && ver != json.version
	{
		message_show("OUTDATED VERSION!");
		exit;
	}
	
	if is_array(json.official)
	{
		for(var i = 0; i < array_length(json.official); i++)
			array_push(officialservers, json.official[i]);
	}
	if is_array(json.community)
	{
		for(var i = 0; i < array_length(json.community); i++)
			array_push(communityservers, json.community[i]);
	}
}
catch (e)
{
	trace(e.longMessage);
	message_show("GRIEVOUS ERROR");
}
