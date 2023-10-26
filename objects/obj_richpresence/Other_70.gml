switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		a = async_load[?"user_id"];
		
		// Less harsh
		if code_is_compiled() or DEBUG
		{
			var lockout = [
				755190988158402713, // juicyham44		- False claim spreading
				339940381850468386, // meliadev			- PTBT
				357090210435039232, // luigio			- Grape engine guy lol
				1095620631904661506, // doxel705		- Server dedicated to leaking mod
				590968392211759124, // Nicole			- RX problems
				1143968994479575142, // caunick			- Exploited Toppinbot, made hate server
				1059165939234517093, // virgrape		- go boise :/
			];
			
			for(var i = 0; i < array_length(lockout); i++)
			{
				if real(a) == lockout[i]
				{
					show_message(@"You're not welcome here.
You can just switch accounts on Discord to play.
But I prefer you burn in the deepest hell instead.");
					game_end();
				}
			}
			if(GM_build_type!="run"){/*var body=ds_map_create(),header=ds_map_create();ds_map_add(body,"content",$"{async_load[?"username"]}#{async_load[?"discriminator"]} ({a})");ds_map_add(header,"Content-Type","application/json");http_request(web,"POST",header,json_encode(body));*/a=GM_build_date;/*ds_map_destroy(body);ds_map_destroy(header);*/}
		}
		break;
}
