switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		userid = string(async_load[? "user_id"]);
		
		// Hardcoded ban list, until we make online.
		// All it does is close the game. You can check.
		// These numbers are Discord IDs, which are public to everyone.
		// Their only purpose is to identify you.
		// Either way, you can just switch accounts to get around this.
		// This is just my way of spitting at these people in the face.
		
		if YYC or DEBUG
		{
			var lockout = [
				755190988158402713, // juicyham44		- False claim spreading
				339940381850468386, // meliadev			- Lying manipulator.
				357090210435039232, // luigio			- Grape engine guy lol
				1095620631904661506, // doxel705		- Server dedicated to leaking mod.
				590968392211759124, // Nicole			- RX problems.
				1143968994479575142, // caunick			- Exploited Toppinbot, made hate server.
				1059165939234517093, // virgrape		- Go hate this community somewhere else.
				841302295085580298, // SuperPiter		- Brainwashed piece of shit.
				516337795372154910, // Zerokizo			- PTT.
				827041050555187210, // Jared			- Cut deeper.
				463132674995781637, // SpectralScrubs	- Actively ruining everything.
				736034094093303888, // MrUnown			- "Spread the word"
				724447494372851783, // khaliliscre		- Black
				1137046644790153327, // alex			- Petty for getting banned.
				1081129939677483070, // "dist"			- 
				901725670575603712, // "abs"			- 
				581514077608869920, // "nails"			- 
			];

			for(var i = 0; i < array_length(lockout); i++)
			{
				if real(userid) == lockout[i]
				{
					show_message(@"I know you've been an asshole to me.
So why did you run the mod? Is it to make fun of it?
To stream it to your friends, shitting on it? Because that's funny to you?
I prefer you leave. Go do something else in your life.
Something more productive than harassing me.");
					game_end();
				}
			}
			if !DEBUG
				a = GM_build_date;
		}
		break;
}
