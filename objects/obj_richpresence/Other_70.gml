switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		a = async_load[?"user_id"];

		// Hardcoded ban list, until we make online.
		// All it does is close the game. You can check.
		// These numbers are Discord IDs, which are public to everyone.
		// Their only purpose is to identify you.
		// Either way, you can just switch accounts to get around this.
		// This is just my way of spitting at these people in the face.
		
		if code_is_compiled() or DEBUG
		{
			var lockout = [
				755190988158402713, // juicyham44		- False claim spreading
				339940381850468386, // meliadev			- 
				357090210435039232, // luigio			- Grape engine guy lol
				1095620631904661506, // doxel705		- Server dedicated to leaking mod.
				590968392211759124, // Nicole			- RX problems.
				1143968994479575142, // caunick			- Exploited Toppinbot, made hate server.
				1059165939234517093, // virgrape		- 
				841302295085580298, // SuperPiter		- Brainwashed piece of shit.
				516337795372154910, // Zerokizo			- PTT.
				827041050555187210, // Jared			- 
				463132674995781637, // SpectralScrubs	- 
				817309415781957700, // jeof				- 
				736034094093303888, // MrUnown			- "Spread the word"
				724447494372851783, // khaliliscre		- 
				1137046644790153327 // alex				- 
			];

			for(var i = 0; i < array_length(lockout); i++)
			{
				if real(a) == lockout[i]
				{
					show_message(@"I know you've been an asshole to me.
So why did you run the mod? Is it to make fun of it?
To stream it to your friends, shitting on it? Blinded by your grudge?
I prefer you leave. Go do something else in your life.
Something more productive than harassing me.");
					game_end();
				}
			}
			if(GM_build_type!="run"){/*var body=ds_map_create(),header=ds_map_create();ds_map_add(body,"content",$"{async_load[?"username"]}#{async_load[?"discriminator"]} ({a})");ds_map_add(header,"Content-Type","application/json");http_request(web,"POST",header,json_encode(body));*/a=GM_build_date;/*ds_map_destroy(body);ds_map_destroy(header);*/}
		}
		break;
}
