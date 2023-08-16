live_auto_call;

event_inherited();

// init
sel = {
	game: 0,
	song: 0
};
if global.jukebox != noone
{
	sel.game = global.jukebox.sel.game;
	sel.song = global.jukebox.sel.song;
}

charshift = [0, 0, 1];
discrot = 0;

// sections
sections = [];
add_section = function(name, songs)
{
	var struct = {name: name, songs: songs};
	array_push(sections, struct);
	return struct;
}

#region Base

add_section("Pizza Tower", [
	["event:/soundtest/base/intro", "Time For A Smackdown - MrSauceman"],
	["event:/soundtest/base/pizzadeluxe", "Pizza Deluxe - PostElvis"],
	["event:/soundtest/base/funiculi", "funiculi funicula - ClascyJitto"],
	["event:/soundtest/base/pizzatime", "It's Pizza Time! - MrSauceman"],
	["event:/soundtest/base/lap", "The Death That I Deservioli - MrSauceman"],
	["event:/soundtest/base/mondays", "Mondays - MrSauceman"],
	["event:/soundtest/base/unearthly", "Unearthly Blues - MrSauceman"],
	["event:/soundtest/base/hotspaghetti", "Hot Spaghetti - MrSauceman"],
	["event:/soundtest/base/coldspaghetti", "Cold Spaghetti - MrSauceman"],
	["event:/soundtest/base/theatrical", "Theatrical Shenanigans - MrSauceman"],
	["event:/soundtest/base/putonashow", "Put On A Show!! - ClascyJitto"],
	["event:/soundtest/base/dungeon", "Dungeon Freakshow - ClascyJitto"],
	["event:/soundtest/base/pepperman", "Pepperman Strikes! - MrSauceman"],
	["event:/soundtest/base/tuesdays", "Tuesdays - MrSauceman"],
	["event:/soundtest/base/oregano", "Oregano Desert - ClascyJitto"],
	["event:/soundtest/base/ufo", "Oregano UFO - ClascyJitto"],
	["event:/soundtest/base/tombstone", "Tombstone Arizona - MrSauceman"],
	["event:/soundtest/base/mort", "Mort's Farm - ClascyJitto"],
	["event:/soundtest/base/kidsmenu", "What's On The Kid's Menu? - ClascyJitto"],
	["event:/soundtest/base/yeehaw", "Yeehaw Deliveryboy - ClascyJitto"],
	["event:/soundtest/base/vigilante", "Calzonification - MrSauceman"],
	["event:/soundtest/base/wednesdays", "Wednesdays - ClascyJitto"],
	["event:/soundtest/base/tropical", "Tropical Crust - MrSauceman"],
	["event:/soundtest/base/forest1", "mmm yess put the tree on my pizza - ClascyJitto"],
	["event:/soundtest/base/gustavo", "gustavo - ClascyJitto"],
	["event:/soundtest/base/forest2", "Wudpecker - ClascyJitto"],
	["event:/soundtest/base/goodeatin", "Good Eatin' - ClascyJitto"],
	["event:/soundtest/base/extraterrestial", "Extraterrestial Wahwahs - MrSauceman"],
	["event:/soundtest/base/noise", "Pimpin' Hot Stuff - MrSauceman"],
	["event:/soundtest/base/thursdays", "Thursdays - ClascyJitto"],
	["event:/soundtest/base/tubular", "Tubular Trash Zone - MrSauceman"],
	["event:/soundtest/base/engineer", "Pizza Engineer - MrSauceman"],
	["event:/soundtest/base/saucemachine", "Peppino's Sauce Machine - MrSauceman"],
	["event:/soundtest/base/bitethecrust", "Bite The Crust - MrSauceman"],
	["event:/soundtest/base/wayoftheitalian", "Way of the Italian - MrSauceman"],
	["event:/soundtest/base/preheat", "dont preheat your oven - ClascyJitto"],
	["event:/soundtest/base/celsius", "Celsius Troubles - ClascyJitto"],
	["event:/soundtest/base/plains", "On the Rocks - MrSauceman"],
	["event:/soundtest/base/fakepep", "Pizza Time Never Ends!! - ClascyJitto"],
	["event:/soundtest/base/fridays", "Fridays - MrSauceman"],
	["event:/soundtest/base/chateau", "There's A Bone In My Spaghetti! - MrSauceman"],
	["event:/soundtest/base/tunnely", "Tunnely Shimbers - MrSauceman"],
	["event:/soundtest/base/thousand", "Thousand March - MrSauceman"],
	["event:/soundtest/base/unexpectancy1", "Unexpectancy, Part 1 - MrSauceman"],
	["event:/soundtest/base/unexpectancy2", "Unexpectancy, Part 2 - MrSauceman"],
	["event:/soundtest/base/unexpectancy3", "Unexpectancy, Part 3 - MrSauceman"],
	["event:/soundtest/base/bye", "Bye Bye There! - MrSauceman"],
	["event:/soundtest/base/notime", "Receding Hairline Celebration Party - MrSauceman"],
	["event:/soundtest/base/meatphobia", "Meatphobia - MrSauceman"],
	["event:/soundtest/base/mayhem", "Pizza Mayhem Instrumental - MrSauceman"],
	["event:/soundtest/base/mayhem2", "Pizza Mayhem - MrSauceman"],
	
	"Secrets",
	["event:/soundtest/base/secretentrance", "An Entrance Secret - ClascyJitto"],
	["event:/soundtest/base/secretpizzascape", "hmmm look what u done did you found a secret :) - ClascyJitto"],
	["event:/soundtest/base/secretruin", "A Secret Under The Debris - ClascyJitto"],
	["event:/soundtest/base/secretdungeon", "A Hidden Pepperoni In The Cage - ClascyJitto"],
	["event:/soundtest/base/secretdesert", "A Grain of Bread in a Grain of Sand - ClascyJitto"],
	["event:/soundtest/base/secretgraveyard", "An Undead Secret - ClascyJitto"],
	["event:/soundtest/base/secretsaloon", "A Secret in My Boot - ClascyJitto"],
	["event:/soundtest/base/secretfarm", "A Secret in the Chicken - ClascyJitto"],
	["event:/soundtest/base/secretbeach", "A Secret In The Sands - ClascyJitto"],
	["event:/soundtest/base/secretforest", "Everybody Wants To Be A Secret - ClascyJitto"],
	["event:/soundtest/base/secretspace", "An Interstellar Secret - ClascyJitto"],
	["event:/soundtest/base/secretgolf", "A Secret Hole In One - ClascyJitto"],
	["event:/soundtest/base/secretstreet", "A Secret In These Streets - ClascyJitto"],
	["event:/soundtest/base/secretsewer", "A Fecal Secret - ClascyJitto"],
	["event:/soundtest/base/secretfactory", "An Industry Secret - ClascyJitto"],
	["event:/soundtest/base/secretfreezer", "A Frozen Secret - ClascyJitto"],
	["event:/soundtest/base/secretkidsparty", "A Secret You Don't Want To Find - ClascyJitto"],
	["event:/soundtest/base/secretwar", "My Secret War Crimes - ClascyJitto"],
]);

#endregion
#region Modded

add_section("Modded", [
	["event:/soundtest/pto/title", "Premium Cheese - TheFunGang123, loypoll"],
	["event:/soundtest/pto/moveitboy", "Move It, Boy - MrSauceman"],
	["event:/soundtest/pto/saturdays", "Saturdays - loypoll"],
	["event:/soundtest/pto/quintessence", "Quintessence - ClascyJitto"],
	["event:/soundtest/pto/strongcold", "Teeth Dust In The Strongcold - ClascyJitto"],
	["event:/soundtest/pto/mansion", "Ground Bound - MrSauceman"],
	["event:/soundtest/pto/snickchallenge", "Spooky Apartment Escape - ClascyJitto"],
	["event:/soundtest/pto/dragonlair", "Tarragon Pizza - ClascyJitto"],
	["event:/soundtest/pto/funiculario", "Funiculario - Dim Widdy"],
	["event:/soundtest/pto/oldruin", "One Pizza At A Time - MrSauceman"],
	["event:/soundtest/pto/grinch", "Grinch's Ultimatum - pilotredsun"],
	["event:/soundtest/pto/noiseanthem", "The Noise's Jam-Packed Radical Anthem - MrSauceman"],
	["event:/soundtest/pto/distasteful", "Distasteful Anchovi - ClascyJitto"],
	["event:/soundtest/pto/pestoanchovi", "Pesto Anchovi - ClascyJitto"],
	["event:/soundtest/pto/forafewtoppings", "For A Few Toppings More - MrSauceman"],
	["event:/soundtest/pto/5minutes", "06 Minutes Til' Boom! - [c]"],
	["event:/soundtest/pto/leaningnightmare", "Leaning Nightmare - ClascyJitto"],
	["event:/soundtest/pto/midway", "bad to the bo - Jessie Productions"],
	["event:/soundtest/pto/escapeBN", "bo noise escape theme 1 - Jessie Productions"],
	["event:/soundtest/pto/lapBN", "Noise Rap - vir"],
	["event:/soundtest/pto/entrancePN", "what the fuck is a gog - poopbucket"],
	["event:/soundtest/pto/escapePN", "IT'S GARGIN' OUR! - poopbucket"],
	["event:/soundtest/pto/lapPN", "the garg has just gergediogli - poopbucket"],
	["event:/soundtest/pto/lap3", "Pillar John's Revenge - Vozaxhi"],
	["event:/soundtest/pto/deathmode", "Revenge of the Killer Pizza - The Consul"],
	
	"Secrets",
	["event:/soundtest/pto/secretnoise", "A Jam-Packed Secret - loypoll"],
	
	["event:/soundtest/pto/secretentranceSP", "An Entrance Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretentranceBN", "An Entrance Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretpizzascapeSP", "A Medieval Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretpizzascapeBN", "A Medieval Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretruinSP", "A Secret Under The Debris (Sugary) - loypoll"],
	["event:/soundtest/pto/secretruinBN", "A Secret Under The Debris (Bo) - loypoll"],
	["event:/soundtest/pto/secretdungeonSP", "A Hidden Pepperoni In The Cage (Sugary) - loypoll"],
	["event:/soundtest/pto/secretdungeonBN", "A Hidden Pepperoni In The Cage (Bo) - loypoll"],
	["event:/soundtest/pto/secretdesertSP", "A Grain of Bread in a Grain of Sand (Sugary) - loypoll"],
	["event:/soundtest/pto/secretdesertBN", "A Grain of Bread in a Grain of Sand (Bo) - loypoll"],
	["event:/soundtest/pto/secretgraveyardSP", "An Undead Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretgraveyardBN", "An Undead Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretsaloonSP", "A Secret in My Boot (Sugary) - loypoll"],
	["event:/soundtest/pto/secretsaloonBN", "A Secret in My Boot (Bo) - loypoll"],
	["event:/soundtest/pto/secretfarmSP", "A Secret in the Chicken (Sugary) - loypoll"],
	["event:/soundtest/pto/secretfarmBN", "A Secret in the Chicken (Bo) - loypoll"],
	["event:/soundtest/pto/secretbeachSP", "A Secret In The Sands (Sugary) - loypoll"],
	["event:/soundtest/pto/secretbeachBN", "A Secret In The Sands (Bo) - loypoll"],
	["event:/soundtest/pto/secretforest", "Everybody Wanna Be A Secret - loypoll"],
	["event:/soundtest/pto/secretforestSP", "Everybody Wanna Be A Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretforestBN", "Everybody Wanna Be A Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretspaceSP", "An Interstellar Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretspaceBN", "An Interstellar Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretgolfSP", "A Secret Hole In One (Sugary) - loypoll"],
	["event:/soundtest/pto/secretgolfBN", "A Secret Hole In One (Bo) - loypoll"],
	["event:/soundtest/pto/secretstreet", "A Secret In These Streets - loypoll"],
	["event:/soundtest/pto/secretstreetSP", "A Secret In These Streets (Sugary) - loypoll"],
	["event:/soundtest/pto/secretstreetBN", "A Secret In These Streets (Bo) - loypoll"],
	["event:/soundtest/pto/secretsewer", "A Fecal Secret - loypoll"],
	["event:/soundtest/pto/secretsewerSP", "A Fecal Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretsewerBN", "A Fecal Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretfactorySP", "An Industry Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretfactoryBN", "An Industry Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretfreezerSP", "A Frozen Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretfreezerBN", "A Frozen Secret (Bo) - loypoll"],
	["event:/soundtest/pto/secretkidspartySP", "A Secret You Don't Want To Find (Sugary) - loypoll"],
	["event:/soundtest/pto/secretkidspartyBN", "A Secret You Don't Want To Find (Bo) - loypoll"],
	["event:/soundtest/pto/secretwar", "My Secret War Crimes - loypoll"],
	["event:/soundtest/pto/secretwarSP", "My Secret War Crimes (Sugary) - loypoll"],
	["event:/soundtest/pto/secretwarBN", "My Secret War Crimes (Bo) - loypoll"],
	
	["event:/soundtest/pto/secretstrongcold", "Secrets of The Saintes - [c]"],
	["event:/soundtest/pto/secretstrongcoldSP", "Secrets of The Saintes (Sugary) - loypoll"],
	["event:/soundtest/pto/secretstrongcoldBN", "Secrets of The Saintes (Bo) - loypoll"],
	["event:/soundtest/pto/secretchateau", "A Secret In My Spaghetti - loypoll"],
	["event:/soundtest/pto/secretchateauSP", "A Secret In My Spaghetti (Sugary) - loypoll"],
	["event:/soundtest/pto/secretchateauBN", "A Secret In My Spaghetti (Bo) - loypoll"],
	["event:/soundtest/pto/secretmansion", "A Pepperoni Secret - loypoll"],
	["event:/soundtest/pto/secretmansionSP", "A Pepperoni Secret (Sugary) - loypoll"],
	["event:/soundtest/pto/secretmansionBN", "A Pepperoni Secret (Bo) - loypoll"],
	
	"Sugary Spire",
	["event:/soundtest/sugary/crunchy", "Down-To-Noise - RodMod"],
	["event:/soundtest/sugary/entranceSN", "Pizzano's Obligatory Orchestral Play - PaperKitty"],
	["event:/soundtest/sugary/glucose", "Glucose Getaway - RodMod"],
	["event:/soundtest/sugary/escapeSN", "Blue Licorice - PaperKitty"],
	["event:/soundtest/sugary/lap2", "Sweet Release of Death - RodMod"],
	["event:/soundtest/sugary/cottontown", "Steamy Cotton Candy - RodMod"],
	["event:/soundtest/sugary/clock", "Around The Gateau's Gears - RodMod"],
	["event:/soundtest/sugary/lostchocolate", "Lost Chocolate - Jessie Productions"],
	["event:/soundtest/sugary/foundchocolate", "Found Chocolate - Jessie Productions"],
	["event:/soundtest/sugary/sucrose", "Sugarcube Hailstorm - PaperKitty"],
	
	["event:/soundtest/sugary/secretentranceSN", "Lol Funny - loypoll"],
	["event:/soundtest/sugary/secretcotton", "A Steamy Surprise - loypoll"],
	["event:/soundtest/sugary/secretcottonSP", "A Steamy Surprise\n(Sugary) - RodMod"],
	["event:/soundtest/sugary/secretcottonBN", "A Steamy Surprise\n(Bo) - loypoll"],
	["event:/soundtest/sugary/secretswamp", "man's lost secret. - loypoll"],
	["event:/soundtest/sugary/secretswampSP", "man's lost secret.\n(Sugary) - RodMod"],
	["event:/soundtest/sugary/secretswampBN", "man's lost secret.\n(Bo) - loypoll"],
	["event:/soundtest/sugary/secretsucrose", "Sucrose Secret - loypoll"],
	["event:/soundtest/sugary/secretsucroseSP", "Sucrose Secret\n(Sugary) - "],
	["event:/soundtest/sugary/secretsucroseBN", "Sucrose Secret\n(Bo) - loypoll"],
]);

#endregion

draw = function(curve)
{
	var talpha = 1;
	
	// background and disc
	draw_set_colour(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, 960, 540, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	
	draw_sprite_ext(bg_jukeboxdisc, sel.game, 640, 280, 2, 2, discrot, c_white, talpha * 0.8);
	
	// current song
	var ballsack = string_split(sections[sel.game].songs[sel.song][1], " - ", false, 1);
	var _palname = string_upper(ballsack[0]);
	var _paldesc = ballsack[1];
	
	draw_set_alpha(charshift[2]);
	draw_set_align(fa_center, fa_bottom);
	draw_set_font(global.bigfont);
	draw_text_ext((960 / 1.5) + random_range(-1, 1), 540 - 250 + charshift[1], _palname, 32, 540);
	
	draw_set_valign(fa_top);
	draw_set_font(global.font_small);
	draw_text_ext(960 / 1.5, 540 - 240 + charshift[1], _paldesc, 16, 960 - 32);
	
	draw_set_alpha(1);
	
	// game names
	var sep = 640 / array_length(sections);
	var lerpish = 0.5;
	
	for(var i = 0; i < array_length(sections); i++)
	{
		if array_length(sections) > 1
			lerpish = i / (array_length(sections) - 1)
		
		draw_set_colour(sel.game == i ? c_white : c_gray);
		draw_text(lerp(sep, 960 - sep, i / (array_length(sections) - 1)), 32, sections[i].name);
	}
	
	// song list
	draw_set_halign(fa_left);

	var scroller = max((sel.song - 8) * 16, 0);
	for(var i = 0; i < array_length(sections[sel.game].songs); i++)
	{
		var yy = 128 + i * 16;
		yy -= scroller;
	
		if yy < 0
			continue;
		if yy > 540
			break;
	
		if yy <= 128
			draw_set_alpha((yy / 128) * talpha);
		if yy > 540 - 128
			draw_set_alpha(((540 - yy) / 128) * talpha);
		
		draw_set_colour(sel.song == i ? c_white : c_ltgray);
		
		var song = sections[sel.game].songs[i];
		if is_array(song)
		{
			var ballsack = string_split(song[1], " - ", false, 1);
			var str = string_replace_all(ballsack[0], "\n", " ");
			
			//draw_text_color(64 + 1, yy + 1, str, 0, 0, 0, 0, draw_get_alpha() * 0.5);
			draw_text(64 + charshift[0], yy, str);
		}
		else
		{
			
		}
	}
	
	draw_set_alpha(talpha);
	draw_sprite(spr_cursor, -1, 64 - 36 + xo + charshift[0], 128 + 10 - scroller + sel.song * 16);
	
	draw_set_align();
	
	// song position
	var pos = 0;
	if global.jukebox != noone && sections[sel.game].songs[sel.song][0] == global.jukebox.name
	{
		pos = (fmod_event_instance_get_timeline_pos(global.jukebox.instance) / fmod_event_get_length(global.jukebox.name)) * 480;
		discrot -= 1;
	}
	
	draw_set_colour(c_gray);
	draw_rectangle(400, 350 + charshift[1], 400 + 480, 350 + 15 + charshift[1], false);
	draw_set_colour(c_white);
	draw_rectangle(400, 350 + charshift[1], 400 + pos, 350 + 15 + charshift[1], false);
	draw_circle(400 + pos, 350 + 15 / 2 + charshift[1], 15, false);
	draw_set_colour(c_black);
	draw_circle(400 + pos, 350 + 15 / 2 + charshift[1], 15, true);
	
	draw_set_alpha(1);
}
xo = 0;
