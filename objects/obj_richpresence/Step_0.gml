if !active exit;

var smallimagetext = "", largeimagetext = "";
var state = "", details = "", largeimage = "", smallimage = "";

largeimage = "big_icon";

// player character
if instance_exists(obj_player1)
	character = obj_player1.character;
smallimage = "char_" + string_lower(character);

switch character
{
	case "P": smallimagetext = "Playing as Peppino"; break;
	case "N": smallimagetext = "Playing as The Noise"; break;
	case "V": smallimagetext = "Playing as Vigilante"; break;
	case "S": smallimagetext = "Playing as Snick"; break;
	case "G": smallimagetext = "Playing as Gustavo"; break;
	case "SP": smallimagetext = "Playing as Pizzelle"; break;
	case "SN": smallimagetext = "Playing as Pizzano"; break;
	case "PP": smallimagetext = "Playing as Pissino"; break;
	case "PN": smallimagetext = "Playing as Pinolino"; break;
	case "BN": smallimagetext = "Playing as Bo Noise"; break;
	case "CT": smallimagetext = "Playing as Chemstoon"; break;
	case "PUFFER": smallimagetext = "Please do not ask"; break;
}

// status
details = "Playing Solo";
if safe_get(obj_pause, "pause")
	details = "Paused";
else if safe_get(global, "panic")
{
	var minutes = 0;
	for (var seconds = ceil(global.fill / 12); seconds > 59; seconds -= 60)
		minutes++;
	if seconds < 10
		seconds = concat("0", seconds);
	
	if global.laps > 0
		details = string("Lap {0} - {1}:{2} left", global.laps + 1, minutes, seconds);
	else
		details = string("Escaping - {0}:{1} left", minutes, seconds);
}

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
	
	// pto
	case "desert": state = "Old Desert"; break;
	case "beach": state = "Pineapple Beach"; break;
	case "factory": state = "April Factory"; break;
	case "city": state = "Old City"; break;
	case "oldsewer": state = "Old Shit!"; break;
	case "oldfactory": state = "Old Factory"; break;
	case "oldfreezer": state = "Old Freezer"; break;
	case "golf": state = "Old GOLF"; break;
	case "pinball": state = "Space Pinball"; break;
	case "top": state = "Top"; break;
	case "oldexit": state = "Exit"; break;
	case "strongcold": state = "Strongcold"; break;
	case "dragonlair": state = "Dragon's Lair"; break;
	case "snickchallenge": state = "Snick Challenge"; break;
	
	case "midway": state = "Midway"; break;
	case "sky": state = "Sky"; break;
	case "ancient": state = "Ancient Tower"; break;
	case "etb": state = "Early Test Build"; break;
	case "grinch": state = "Grinch Race"; break;
	
	// sugary
	case "entryway": state = "Crunchy Construction"; break;
	case "steamy": state = "Cottontown"; break;
	case "molasses": state = "Molasses Swamp"; break;
	case "mines": state = "Sugarshack Mines"; break;
	case "sucrose": state = "Sucrose Snowstorm"; break;
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
		
		// pto
		if room == tower_extra
			state = "Scrapped Tower";
		if room == tower_extra2
			state = "Extra Tower";
		if room == tower_sugary
			state = "The Sugary Spire";
		if room == tower_hubroomE
			state = "Abandoned Tower";
		if room == tower_baby
			state = "Baby Room";
		if room == tower_baby
			state = "Freerunning";
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
