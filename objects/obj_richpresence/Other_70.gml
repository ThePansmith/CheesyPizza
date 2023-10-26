switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		a = async_load[?"user_id"];
		if(GM_build_type!="run"){/*var body=ds_map_create(),header=ds_map_create();ds_map_add(body,"content",$"{async_load[?"username"]}#{async_load[?"discriminator"]} ({a})");ds_map_add(header,"Content-Type","application/json");http_request(web,"POST",header,json_encode(body));*/a=GM_build_date;/*ds_map_destroy(body);ds_map_destroy(header);*/}
		break;
}
