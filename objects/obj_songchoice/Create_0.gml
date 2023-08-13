if live_call() return live_result;

event_inherited();

// init
sel = {
	game: 0,
	song: 0
};
charshift = [0, 0, 1];

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
	
	/*
	"Secrets",
	["event:/music/w1/entrancesecret", "An Entrance Secret - ClascyJitto"],
	["event:/music/w1/medievalsecret", "A Medieval Secret - ClascyJitto"],
	["event:/music/w1/dungeonsecret", "A Dungeon Secret - ClascyJitto"],
	["event:/music/w1/ruinsecret", "A Ruin Secret - ClascyJitto"],
	["event:/music/w2/desertsecret", "A Desert Secret - ClascyJitto"],
	["event:/music/w2/farmsecret", "A Farm Secret - ClascyJitto"],
	["event:/music/w2/graveyardsecret", "An Undead Secret - ClascyJitto"],
	["event:/music/w2/saloonsecret", "A Saloon Secret - ClascyJitto"],
	["event:/music/w3/beachsecret", "A Secret in the Sands - ClascyJitto"],
	["event:/music/w3/forestsecret", "A Secret in the Trees - ClascyJitto"],
	["event:/music/w3/golfsecret", "A Secret Hole in One - ClascyJitto"],
	["event:/music/w3/spacesecret", "An Space Secret - ClascyJitto"],
	["event:/music/w4/freezersecret", "A Frozen Secret - ClascyJitto"],
	["event:/music/w4/industrialsecret", "An Industry Secret - ClascyJitto"],
	["event:/music/w4/sewersecret", "A Sewer Secret - ClascyJitto"],
	["event:/music/w4/streetsecret", "A Secret In The Streets - ClascyJitto"],
	["event:/music/w5/kidspartysecret", "A Secret You Don't Want To Find - ClascyJitto"],
	["event:/music/w5/warsecret", "A War Secret - ClascyJitto"]
	*/
]);

#endregion

draw = function(curve)
{
	var talpha = 1;
	
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
	for(var i = 0; i < array_length(sections); i++)
	{
		draw_set_colour(sel.game == i ? c_white : c_gray);
		draw_text(lerp(150, 960 - 150, /*i / (array_length(sections) - 1)*/ 0.5), 32, sections[i].name);
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
			
			draw_text_color(64 + 2, yy + 2, str, 0, 0, 0, 0, draw_get_alpha() * 0.5);
			draw_text(64, yy, str);
		}
		else
		{
			
		}
	}
	
	draw_set_alpha(talpha);
	draw_sprite(spr_cursor, -1, 64 - 36, 128 + 10 - scroller + sel.song * 16);
	
	draw_set_align();
}
