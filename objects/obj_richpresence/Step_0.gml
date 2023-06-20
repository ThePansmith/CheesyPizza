if !active exit;

var smallimagetext = "", largeimagetext = "";
var state = "", details = "", largeimage = "", smallimage = "";

largeimage = "big_icon";

// status
details = "Offline";

// level
switch safe_get(global, "leveltosave")
{
	case "entrance": state = "John Gutter"; break;
	case "medieval": state = "Pizzascape"; break;
	case "ruin": state = "Ancient Cheese"; break;
	case "dungeon": state = "Bloodsauce Dungeon"; break;
	case "badland": state = "Oregano Desert"; break;
	case "graveyard": state = "Wasteyard"; break;
	case "farm": state = "Fun Farm"; break;
	case "saloon": state = "Fast Food Saloon"; break;
	case "plage": state = "Crust Cove"; break;
	case "forest": state = "Gnome Forest"; break;
	case "space": state = "Deep-Dish 9"; break;
	case "minigolf": state = "GOLF"; break;
	case "street": state = "The Pig City"; break;
	case "sewer": state = "Oh Shit!"; break;
	case "industrial": state = "Peppibot Factory"; break;
	case "freezer": state = "Refrigerator-Refrigerador-Freezerator"; break;
	case "chateau": state = "Pizzascare"; break;
	case "kidsparty": state = "Don't Make A Sound"; break;
	case "war": state = "WAR"; break;
	case "exit": state = "The Crumbling Tower of Pizza"; break;
	
	// ptt
	case "desert": details = "Old Desert"; break;
	case "beach": details = "Pineapple Beach"; break;
	case "factory": details = "April Factory"; break;
	case "city": details = "Old City"; break;
	case "oldsewer": details = "Old Shit!"; break;
	case "oldfactory": details = "Old Factory"; break;
	case "oldfreezer": details = "Old Freezer"; break;
	case "golf": details = "Old GOLF"; break;
	case "pinball": details = "Space Pinball"; break;
	case "top": details = "Top"; break;
	case "oldexit": details = "Exit"; break;
	case "strongcold": details = "Strongcold"; break;
	case "dragonlair": details = "Dragon's Lair"; break;
	
	case "ancient": details = "Ancient Tower"; break;
	case "etb": details = "Early Test Build"; break;
}

// add rank and score
if state != ""
{
	var rank = "?";
	if global.collect >= global.srank
		rank = scr_is_p_rank() ? "P" : "S";
	else if global.collect >= global.arank
		rank = "A";
	else if global.collect >= global.brank
		rank = "B";
	else if global.collect >= global.crank
		rank = "C";
	else
		rank = "D";
	
	state += string(" - {0} ({1})", global.collect, rank);
	
	// Pizzascape - 10000 (S)
}

// not a level
if state == ""
{
	var r = room_get_name(room);
	
	// tower floors
	if string_starts_with(r, "tower_")
	{
		var f = string_digits(r);
		
		if room == tower_entrancehall
			state = "Tower Entrance";
		if room == tower_johngutterhall
			state = "John Gutter Hall";
		if f == "1"
			state = "Tower Lobby";
		if f == "2"
			state = "Western District";
		if f == "3"
			state = "Vacation Resort";
		if f == "4"
			state = "Slum";
		if f == "5"
			state = "Staff Only";
		if room == tower_laundryroom
			state = "Wash 'n' Clean";
		if room == tower_mansion
			state = "Tower Mansion";
		if room == tower_noisettecafe
			state = "Noisette's Café";
		if room == tower_pizzafacehall
			state = "Unknown";
		if room == tower_pizzaland
			state = "Pizzaland";
		if room == tower_graffiti
			state = "Mr. Car";
		if room == tower_ravine
			state = "Ravine";
		if room == tower_ruinsecret
			state = "Old Tower";
		if room == tower_finalhallway
			state = "Control Room";
		if room == tower_soundtest
			state = "Sound Test";
		if room == tower_outside
			state = "Tower Outside";
		if string_pos("tutorial", r) > 0
			state = "Tutorial";
		
		// ptt
		if room == basement_1
			state = "Tower Basement";
	}
	
	// cutscenes
	if room == Loadiingroom
		state = "Loading...";
	if room == Mainmenu
		state = "Main Menu";
	if room == timesuproom
		state = "Time's Up!";
	if room == Longintro
		state = "Are you ready?";
	if room == Finalintro
		state = "Cliff Cutscene";
	if room == Endingroom
		state = "Ending";
	if room == Creditsroom
		state = "Credits";
	if room == Johnresurrectionroom
		state = "Ending";
	if room == characterselect
	{
		state = "Server Menu";
		details = "";
	}
	
	// bosses
	if room == boss_pepperman
		state = "Pepperman";
	if room == boss_vigilante
		state = "Vigilante";
	if room == boss_noise
		state = "The Noise";
	if room == boss_fakepep or room == boss_fakepepkey or room == boss_fakepephallway
		state = "Fake Peppino";
	if room == boss_pizzaface or room == boss_pizzafacefinale
		state = "Pizzaface";
	if room == boss_pizzafacehub
		state = "Top of The Pizza Tower"
}
if room == rank_room
	state = "Ranking";

np_setpresence(state, details, largeimage, smallimage);
np_setpresence_more(smallimagetext, largeimagetext, false);
