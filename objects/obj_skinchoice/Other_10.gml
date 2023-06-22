if live_call() return live_result;

palettes = [];
mixables = [];

/// @description skins
var character = characters[sel.char][0];
switch character
{
	#region Peppino
	
	default:
		add_palette(0, "yellow", noone, "Yellow", "Legends say he was pissed on...");
		add_palette(1, "classic", noone, "Peppino", "A somewhat overweight Italian chef.", "");
		add_palette(3, "unfunny", noone, "Unfunny", "Just like me, fr!");
		add_palette(4, "money", noone, "Money Green", "I love money too.");
		add_palette(5, "sage", noone, "Sage Blue", "The PTSD was great.");
		add_palette(6, "blood", noone, "Blood Red", "Is it that famous plumber on TV?");
		add_palette(7, "tv", noone, "TV Purple", "Go ahead. Get this legitimately.");
		add_palette(8, "dark", noone, "Dark", "It's not just a phase, MOM.");
		add_palette(9, "shitty", noone, "Shitty", "Weird, mine's usually red.");
		add_palette(10, "golden", noone, "Golden God", "No Italian is worth this much.");
		add_palette(11, "garish", noone, "Garish", "Feeling a little Sugary?");
		add_palette(15, "mooney", noone, "Mooney Orange", "He bought cigarettes with that money.");
		add_palette(16, "", noone, "Frostbite", "Lesson learned, don't bathe in a freezer.", "FROZEN");
		add_palette(17, "", noone, "Dark Gray", "Depresso spaghetto.", "DARK");
		add_palette(18, "", noone, "Speed Demon", "You're quick as hell!", "SPEEDY");
		add_palette(19, "", noone, "Blazing Heat", "Stings like a bad curry.", "HEATED");
		add_palette(20, "", noone, "Bread Winner", "Let's get that dough.", "INTERN");
		add_palette(21, "", noone, "Cheesed Up", "This can't brie happening.", "CHEESY");
		add_palette(22, "", noone, "Chalk Eater", "Barney? Is that you?", "MEAN");
		add_palette(23, "", noone, "Snottino", "Picked and flicked.", "SNOTTY");
		add_palette(24, "", noone, "Majin", "Fun is Infinite.", "MAJIN");
		add_palette(25, "", noone, "Brulo", "Anton's gonna be PISSED.", "BRULO");
		add_palette(26, "", noone, "Super Meat Boy", "Push the buttons.", "MEATY");
		add_palette(27, "", noone, "Creamsicle", "Stay frosty out there.", "CREAMY");
		add_palette(28, "", noone, "So Retro", "Batteries sold separately.", "RETRO");
		add_palette(29, "", noone, "Gabaghoul", "Grains Graains.", "GHOULISH");
		add_palette(30, "", noone, "Grinch", "Have I truly become a monster?", "GRINCH");
		add_palette(31, "", noone, "Monster Mash", "Rise from your grave.", "ZOMBIFIED");
		add_palette(32, "", noone, "Kirby", "Defender of Planet Popstar.", "PINK");
		add_palette(33, "", noone, "Purple Pro", "It's not a Snick reference.", "PURPLE");
		add_palette(34, "", noone, "Bold And Brash", "More like, belongs in the trash.", "GRAYISH");
		add_palette(35, "", noone, "Fallen Down", "Mt. Ebbot 201x.", "SEPIA");
		add_palette(36, "", noone, "Untextured", "You seem rather pale.", "PALE");
		add_palette(37, "", noone, "Dead Meat", "That sucks.");
		add_palette(38, "", noone, "Unshaded", "mat_fullbright", "UNSHADED");
		add_palette(39, "", noone, "Warzone", "Deploying tactical italian.", "WORN");
		add_palette(40, "", noone, "Block Party", "The pillars of the community.", "PILLAR");
		add_palette(41, "", noone, "Machine Code", "Hack the planet.", "HACKER");
		add_palette(42, "", noone, "Button Masher", "Don't blame the controller.");
		add_palette(43, "", noone, "Orange Juice", "Hey Apple", "ORANGE");
		add_palette(44, "", noone, "Pasta Power", "The princess is in another castle.", "JUMPMAN");
		add_palette(45, "", noone, "Sucrose Snowstorm", "A little sweetness never hurts.", "SWEET");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "When you spam Big Chungus in general.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Woven with Grandpa's intestines.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "You DID pirate it, right?");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "Freefire o si");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "Take my upvote and leave.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "(Guitar riff)");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "Get it? It's funny because");
		add_palette(12, "war", spr_peppattern8, "War Camo", "drafted");
		add_palette(12, "john", spr_peppattern9, "John Suit", "Finally, you can wear merch of dead people.");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "Peppino says Trans Rights!");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "Oh, fiddlesticks! What now?");
		add_palette(12, "", spr_pattern_minecraft_water, "Minecraft Water", "You bring a bucket?");
		add_palette(12, "", spr_pattern_minecraft_lava, "Minecraft Lava", "Don't fuck it up.");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(12, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "Still playing with balls?");
		add_palette(12, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
	#region Gustavo (clone of pep's palettes)
	
	case "G":
		add_palette(0, "yellow", noone, "Yellow", "When you see it, you'll shit Bricks.");
		add_palette(1, "classic", noone, "Gustavo and Brick", "The iconic duo.", "");
		add_palette(3, "unfunny", noone, "Unfunny", "He turned himself into a rat!\nFunniest shit I've ever seen.");
		add_palette(4, "money", noone, "Money Green", "You wanna be a superstar?");
		add_palette(5, "sage", noone, "Sage Blue", "PTSD stands for Pizza Tower Sage Demo.");
		add_palette(6, "blood", noone, "Blood Red", "It's-a me!");
		add_palette(7, "tv", noone, "TV Purple", "Get all P-Ranks as Gustavo.");
		add_palette(8, "dark", noone, "Dark", "His rat is the only thing that keeps him alive...");
		add_palette(9, "shitty", noone, "Shitty", "You can't get this achievement as Gustavo.");
		add_palette(10, "golden", noone, "Golden God", "Head of Pizza.");
		add_palette(11, "garish", noone, "Garish", "You've got my attention.");
		add_palette(15, "mooney", noone, "Mooney Orange", "Greedy stereotype cosplay!");
		
		add_palette(16, "", noone, "Freezer Burn", "Worry not, the rat IS harmed.", "FROZEN");
		add_palette(17, "", noone, "Dark Gray", "Hello darkness, my old friend...", "DARK");
		add_palette(18, "", noone, "Speed Demon", "You're quick as hell!", "SPEEDY");
		add_palette(19, "", noone, "Blazing Heat", "Stings like a bad curry.", "HEATED");
		add_palette(20, "", noone, "Bread Winner", "Let's get that dough.", "INTERN");
		add_palette(21, "", noone, "Cheesed Up", "This can't brie happening.", "CHEESY");
		add_palette(22, "", noone, "Chalk Eater", "Barney? Is that you?", "MEAN");
		add_palette(23, "", noone, "Snottino", "Picked and flicked.", "SNOTTY");
		add_palette(24, "", noone, "Majin", "Fun is Infinite.", "MAJIN");
		add_palette(25, "", noone, "Brulo", "Anton's gonna be PISSED.", "BRULO");
		add_palette(26, "", noone, "Super Meat Boy", "Push the buttons.", "MEATY");
		add_palette(27, "", noone, "Creamsicle", "Stay frosty out there.", "CREAMY");
		add_palette(28, "", noone, "So Retro", "Batteries sold separately.", "RETRO");
		add_palette(29, "", noone, "Gabaghoul", "Grains Graains.", "GHOULISH");
		add_palette(30, "", noone, "Grinch", "Have I truly become a monster?", "GRINCH");
		add_palette(31, "", noone, "Monster Mash", "Rise from your grave.", "ZOMBIFIED");
		add_palette(32, "", noone, "Dreamland Duo", "Defenders of Planet Popstar.", "PINK");
		add_palette(33, "", noone, "Purple Pros", "It's not a Snick reference.", "PURPLE");
		add_palette(34, "", noone, "Bold And Brash", "More like, belongs in the trash.", "GRAYISH");
		add_palette(35, "", noone, "Fallen Down", "Mt. Ebbot 201x.", "SEPIA");
		add_palette(36, "", noone, "Yin Yang", "Perfectly balanced.", "PALE");
		add_palette(37, "", noone, "Dead Meat", "May contain traces of rat.");
		add_palette(38, "", noone, "Kentucky Fried", "Original or extra crispy?", "FRIED");
		add_palette(39, "", noone, "Warzone", "Deploying tactical italian.", "DISGUISED");
		add_palette(40, "", noone, "Block Party", "The pillars of the community.", "PILLAR");
		add_palette(41, "", noone, "Machine Code", "Hack the planet.", "HACKER");
		add_palette(42, "", noone, "Button Masher", "Don't blame the controller.");
		add_palette(43, "", noone, "Aperture Science", "Start thinking with portals.", "APERTURE");
		add_palette(44, "", noone, "Pasta Power", "The princess is in another castle.", "JUMPMAN");
		add_palette(45, "", noone, "Sucrose Snowstorm", "A little sweetness never hurts.", "SWEET");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "I'm running out of Big Chungus jokes for this.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Just the right fit.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "Makes sense.");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "About 30 rats were killed to get this.\nThink about that.");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "What are those white spots.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "You seem to have a severe lack of calcium.\nLet me give you some of my milk.");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "Look, the rat's clearly laughing.");
		add_palette(12, "war", spr_peppattern8, "War Camo", "At one point, Gustavo was canonically Peppino's brother.");
		add_palette(12, "john", spr_peppattern9, "John Suit", "I mean, he only killed 2 of them.");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "Gustavo and Brick say Trans Rights!");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", " ");
		add_palette(12, "", spr_pattern_minecraft_water, "Minecraft Water", "You bring a bucket?");
		add_palette(12, "", spr_pattern_minecraft_lava, "Minecraft Lava", "Don't fuck it up.");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(12, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "Still playing with balls?");
		add_palette(12, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
	#region Noise
	
	case "N":
		add_palette(0, "", noone, "The Noise", "The mischievous gremlin.", "");
		add_palette(2, "", noone, "Peppino", "The one and only...?");
		add_palette(3, "", noone, "Snick", "It's him...?", "PURPLE");
		add_palette(4, "", noone, "Grinch", "IIIIIIT'S CHRIMMAAAAAAAA", "GRINCH");
		add_palette(5, "", noone, "Inverted", "Ooo... scary...!");
		add_palette(6, "", noone, "Naked", "Wow. Yikes.");
		add_palette(7, "", noone, "The Goise", "Unused character in final game!");
		add_palette(8, "", noone, "ARG", "I got the key piece!", "VILE");
		add_palette(9, "", noone, "Radie", "Do NOT eat it.", "CUTE");
		add_palette(10, "", noone, "Spicy", "This adds a whole new layer to the heat meter.", "SPICED");
		add_palette(11, "", noone, "Mad Milk", "That's not milk.", "MILKY");
		add_palette(13, "", noone, "Minted", "Scraped from under the table.", "MINTY");
		add_palette(14, "", noone, "Ralsei", "The prince of darkness.\n... cutest boy.", "DARKNER");
		add_palette(15, "", noone, "Snoid", "Snot really funny when it happens to you, is it?", "SNOTTY");
		add_palette(16, "", noone, "Mr. Orange", "I'm seeing double! Four Noise!");
		add_palette(17, "", noone, "Inkplot", "Straight outta the 1920's.", "INKY");
		add_palette(18, "", noone, "Eggplant", "Have we, uh, set those ranks yet...?", "EGGPLANT");
		add_palette(19, "", noone, "Hardoween", "When the ween is hard!");
		add_palette(20, "", noone, "The Doise", "Do not steal.", "DOISE");
		add_palette(21, "", noone, "Noisette", "Can you out-noise The Noise?");
		add_palette(22, "", noone, "The Noid", "Better avoid him.", "NOID");
		add_palette(23, "", noone, "Galaxy", "Wow it is Just like the Samsung Galaxy S23", "GALAXY");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "10 years behind bars for spamming Big Chungus.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Woven with Grandma's intestines.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "I thought he... collected candy?");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "He committed genocide against RATS.");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "Thanks for the gold, kind stranger.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "Bad to the Noise.");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "I'm trying really hard to laugh.");
		add_palette(12, "war", spr_peppattern8, "War Camo", "Every war had a distraction clown.");
		add_palette(12, "john", spr_peppattern9, "John Suit", "Genuinely, the concept of this is morbid.");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "The Noise says Trans Rights!");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "Well, it's still playable.");
		add_palette(12, "", spr_pattern_minecraft_water, "Minecraft Water", "DO NOT drop it.");
		add_palette(12, "", spr_pattern_minecraft_lava, "Minecraft Lava", "How do you do this, anyway...?");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(12, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "Still playing with balls?");
		add_palette(12, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
	#region Vigilante
	
	case "V":
		add_palette(0, "", noone, "Vigilante", "AKA Vigert Ebenezer Lantte.", "");
		add_palette(1, "", noone, "Halloween", "Trick or treat... this is a threat.", "SCARY");
		add_palette(2, "", noone, "MM8BDM", "A very exciting night.", "DEATHMATCH");
		add_palette(3, "", noone, "Chocolante", "It's still cheese, trust me.", "CHOCOLATE");
		add_palette(4, "", noone, "Gutter Colored", "A hungry slime.", "GUTTED");
		add_palette(5, "", noone, "Golden", "Something, something, carrots.", "GOLDEN");
		add_palette(6, "", noone, "Cheddar", "Cheddar cheese is a relatively hard, off-white (or orange if colourings such as annatto are added), sometimes sharp-tasting, natural cheese. Originating in the English village of Cheddar in Somerset, cheeses of this style are now produced beyond the region and in several countries around the world.", "CHEDDAR");
		add_palette(7, "", noone, "Sepia", "Wildstyle pistolero.", "SEPIA");
		add_palette(8, "", noone, "Snick", "It's NOT him. Never trust purple cheese.", "PURPLE");
		add_palette(9, "", noone, "Emerald", "Hmm.", "EMERALD");
		add_palette(10, "", noone, "Holiday", "Merry Cheesemas!", "HOLIDAY");
		add_palette(11, "", noone, "Cheese Man", "A gag of the Johnson subject.", "TANKMAN");
		add_palette(13, "", noone, "Vigilatte", "Chocolate milk. Hey, didn't we see this before?", "MILKY");
		add_palette(14, "", noone, "Bloodsauce", "Who the hell dipped cheese in ketchup?!", "BLOODY");
		add_palette(15, "", noone, "Vigilatex", "What the fuck", "DARK");
		add_palette(16, "", noone, "Morshu", "It's yours, my friend.", "MORSHU");
		add_palette(17, "", noone, "Snotty", "Snotty Approved", "SNOTTY");
		add_palette(18, "", noone, "Vigirat", "That sneaky, lonesome, and cheese-loving outlaw.", "RAT");
		add_palette(19, "", noone, "Satan's Choice", "Get ready for a flavor that's hotter than a Texas summer day.", "DEVILISH");
		add_palette(20, "", noone, "Gas Station Weed", "Man, I feel like a tumbleweed caught in a tornado.", "WEED");
		add_palette(21, "", noone, "Platinum Pardner", "Lookin' just as fancy as a silver dollar.", "PLATINUM");
		add_palette(22, "", noone, "Country Blues", "The perfect soundtrack for your taste buds.", "MOLDY");
		add_palette(23, "", noone, "Nubert", "Everybody loves him.", "NUBERT");
		add_palette(24, "", noone, "Big Iron", "Walk softly and carry a big gun.", "IRON");
		add_palette(25, "", noone, "Digital Cheese", "Just one little byte.", "DIGITAL");
		add_palette(26, "", noone, "Hell Raisin", "Pruned to perfection.", "RAISIN");
		add_palette(27, "", noone, "Game Genie", "Winners don't use cheats!", "CHEATER");
		add_palette(28, "", noone, "Sticky Jumper", "Aye, that's the way ye do it.", "STICKY");
		add_palette(29, "", noone, "Fruit Punch", "Taste these fists, Punk!", "FRUITY");
		add_palette(30, "", noone, "8-Bit Bandit", "Get your head in the game.", "8-BIT");
		add_palette(31, "", noone, "Virtual Boy", "Digital nausea guaranteed.", "VIRTUAL");
		add_palette(32, "", noone, "Downwell", "Fully loaded and ready to roll.", "DOWNWELL");
		add_palette(33, "", noone, "Lightner", "You still can't cast magic.", "LIGHTNER");
		add_palette(34, "", noone, "Ectoplasm", "Who you gonna' call?", "ECTOPLASM");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "There are clown cowboys?");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sombrero", "That's not a fucking sweater.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "He's a pizza ingredient...");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "Dynamite. Genius.\nThat's exactly how I'd take out rats.");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "All enemies turn golden too, right? Please.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "Cheesy reference goes here.");
		add_palette(12, "pp", spr_peppattern7, "PP Hat", "Who's been drawing ºººº");
		add_palette(12, "war", spr_peppattern8, "War Camo", "This doesn't fit.");
		add_palette(12, "john", spr_peppattern9, "John Cap", "Now you can wear a HAT of dead people.");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "The Vigilante says Trans Rights!");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "You can find them online, don't worry.");
		add_palette(12, "", spr_pattern_minecraft_water, "Minecraft Water", "Did you ever put cheese in water?");
		add_palette(12, "", spr_pattern_minecraft_lava, "Minecraft Lava", "Honestly. Relatable.");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(12, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "Still playing with balls?");
		add_palette(12, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
	#region Snick
	
	case "S":
		add_palette(0, "", noone, "Snick", "It's him!", "");
		add_palette(1, "", noone, "Tail", "Not two, not three, just one.");
		add_palette(2, "", noone, "Shader", "im the greatest living thing my duderino");
		add_palette(3, "", noone, "Boots", "Unlike Snick...");
		add_palette(4, "", noone, "Snickette", "Not to be confused with... you know.");
		add_palette(5, "", noone, "Master System", "Brought to you by Snicksoft!");
		add_palette(6, "", noone, "Dark", "The obligatory emo palette.");
		add_palette(7, "", noone, "Cyan", "There's a reference here I'm not saying.");
		add_palette(8, "", noone, "Transparent", "I know him inside out.");
		add_palette(9, "", noone, "Manual", "He's hosting his own event!");
		add_palette(10, "", noone, "Sketch", "Let's just say he likes burgers.");
		add_palette(11, "", noone, "Shitty", "Particularly fond of GOLF.");
		add_palette(13, "", noone, "Halloween", "Haha don't worry, he's not dead YET.");
		add_palette(14, "", noone, "Gameboy", "So retro.");
		add_palette(15, "", noone, "Hellsnick", "Si.");
		add_palette(16, "", noone, "Majin", "Don't you dare.");
		add_palette(17, "", noone, "Neon", "Cool? Check. Eye-straining? Also check.");
		add_palette(18, "", noone, "Super Snick", "He got the 7 chaos rubies.");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "When you spam Big Chungus in general.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Woven with Grandpa's intestines.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "You DID pirate it, right?");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "Freefire o si");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "Take my upvote and leave.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "(Guitar riff)");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "Get it? It's funny because");
		add_palette(12, "war", spr_peppattern8, "War Camo", "drafted");
		add_palette(12, "john", spr_peppattern9, "John Suit", "Finally, you can wear merch of dead people.");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "Snick says Trans Rights!");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "Oh, fiddlesticks! What now?");
		add_palette(12, "", spr_pattern_minecraft_water, "Minecraft Water", "You bring a bucket?");
		add_palette(12, "", spr_pattern_minecraft_lava, "Minecraft Lava", "Don't fuck it up.");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(12, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "Still playing with balls?");
		add_palette(12, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
	#region Pizzelle
	
	case "SP":
		add_palette(0, "", noone, "Yellow", "Take the first 4 letters of her name.");
		add_palette(1, "", noone, "Pizzelle", "It's the Candy-making patisje!", "");
		add_palette(2, "", noone, "Sugar", "Obviously sugar is green.");
		add_palette(3, "", noone, "Familiar Gremlin", "Something's wrong.");
		add_palette(4, "", noone, "Massacre", "SUGARY SPIRE 2: The Quest for Diabetes.");
		add_palette(5, "", noone, "Rivals", "Did we find a coder yet?");
		add_palette(6, "", noone, "Gum", "Don't actually chew her, please.");
		add_palette(7, "", noone, "Old School", "Also known as... grayscale.", "GRAYSCALE");
		add_palette(8, "", noone, "Zombified", "Bruuuh.", "ZOMBIFIED");
		add_palette(9, "", noone, "Forestation", "Made of sugarcane plants.");
		add_palette(10, "", noone, "Lamda", "I have nothing to say about this.", "LAMDA");
		add_palette(11, "", noone, "Gnome Wizard", "Really diving deep into the gremlin persona.", "GNOME");
		add_palette(13, "", noone, "Oversweetened", "Get that candy off-a there!", "SWEETENED");
		add_palette(14, "", noone, "Candy Cane", "It's the Candy        !", "CANDY");
		add_palette(15, "", noone, "Pumpkin", "Now with 30% less fiber.", "PUMPKIN");
		add_palette(16, "", noone, "SAGE", "Do upside down slopes make it a Sonic game?");
		add_palette(17, "", noone, "DOOM", "It's the rip-n-tearing patisje!", "SLAYER");
		add_palette(18, "", noone, "Annie", "It's ball-busting time.", "BALL-BUSTING");
		add_palette(19, "", noone, "Scooter", "I- ...wh- what?", "SCOOTER");
		add_palette(20, "", noone, "Blurple", "Also known as \"test\".");
		add_palette(21, "", noone, "Paintlad", "Very original name there.", "PAINTLAD");
		add_palette(22, "", noone, "Cotton Candy", "Delicious colors. I love them.", "COTTON");
		add_palette(23, "", noone, "Green Apple", "The least favorite candy flavor.", "COATED");
		add_palette(24, "", noone, "Secret", "Lookie! You've found a pretty sweet surprise.", "SECRET");
		add_palette(25, "", noone, "Stupid Rat", "Once loved, now you get an achievement for killing them.", "RAT");
		add_palette(26, "", noone, "Pastel", "Soft on the eyes...", "PASTEL");
		add_palette(27, "", noone, "Burnt", "But what went wrong?", "BURNT");
		add_palette(28, "", noone, "Crazy Frog", "Ding ding!", "CRAZY");
		add_palette(29, "", noone, "Factory", "PLEASE. I BEG YOU.", "INDUSTRIAL");
		add_palette(30, "", noone, "Harsh Pink", "Bismuth subsalicylate.", "PINK");
		add_palette(31, "", noone, "Shadow", "SHUT UP! My dad works at Sugary Spire and can give you PREGNANT.", "SHADOW");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "So the exact opposite of the Sugary team.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Woven with Grandpa's intestines.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "Something doesn't add up.");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "Freefire o si");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "Take my upvote and leave.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "(Guitar riff)");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "Lol! XD! Lmfao. That's so");
		add_palette(12, "war", spr_peppattern8, "War Camo", "drafted");
		add_palette(12, "john", spr_peppattern9, "John Suit", "Use the next palette instead.");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "Correct.");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "Use the previous palette instead.");
		add_palette(12, "", spr_pattern_minecraft_water, "Minecraft Water", "You bring a bucket?");
		add_palette(12, "", spr_pattern_minecraft_lava, "Minecraft Lava", "Don't fuck it up.");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(12, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "You wanna play with balls don't you.");
		add_palette(12, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
	#region Pissino
	
	case "PP":
		add_palette(0, "", noone, "Pissino", "God is dead and we killed him.", "");
		add_palette(1, "", noone, "White", "There's no joke here.");
		add_palette(3, "", noone, "Red", "It could also be-a him, for all we know.");
		add_palette(4, "", noone, "Blue", "The day he forgot his purpose...");
		add_palette(5, "", noone, "Freddy", "Hor, hor, hor-hor, hor.", "SHITTY");
		add_palette(6, "", noone, "Sketch", "Please make sprite Please", "SKETCH");
		add_palette(7, "", noone, "Grand Dad", "Hilarity ensues.", "GRAND");
		add_palette(8, "", noone, "Dorito", "I do love chips with a side of piss.", "DORITO");
		add_palette(9, "", noone, "Black", "Not the clothes.", "BLACK");
		add_palette(10, "", noone, "Metal", "Balls of steel.", "METAL");
		add_palette(11, "", noone, "???", "You can't get darker than this.", "SHADOW");
		add_palette(15, "", noone, "Random", "This isn't even a joke, and I'm asking this personally. Who hurt you? What happened for things to be this way? Are you okay, mentally?");
		add_palette(16, "", noone, "Grunt", "They must be living a pretty sad life right now.", "SAD");
		add_palette(17, "", noone, "McDonalds", "Dogshit. Only their nuggets are good.", "PISS");
		add_palette(18, "", noone, "Elmo", "You have come to his event. Now you must endure forceful cosplay.", "ELMO");
		add_palette(19, "", noone, "Manual", "You ever just, uh, feel like emanating a STRONG stench of urine?");
		add_palette(20, "", noone, "Snick", "It's not him. It's NOT HIM. RUN AWAY.", "SNICK");
		add_palette(21, "", noone, "The Evil", "The past!");
		add_palette(22, "", noone, "Super Mario", "HOLY FUCKING SHIT");
		add_palette(23, "", noone, "Lean", "Jokes have a lifespan.", "LEAN");
		add_palette(24, "", noone, "4chan Mystery Box", "Settle down, you're going insane.");
		add_palette(25, "", noone, "Brody Foxx", "He died in 2006 from a severe ketamine overdose.", "YO MAMA SO");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "When you spam racial slurs in general.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Just drench it with piss, that usually does the trick.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "Not quite.");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "Facebook rat video.");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "No, downvote him.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "That's fitting.");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "Time really is a flat circle.");
		add_palette(12, "war", spr_peppattern8, "War Camo", "A piss bomb sounds like a war crime.");
		add_palette(12, "john", spr_peppattern9, "John Suit", "John who?");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "Giving this a description would be very dangerous.");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "Oh, fiddlesticks! What now?");
		add_palette(12, "", spr_pattern_mario, "Mario Shirt", "After 6 months of development, it's finally here.");
		break;
	
	#endregion
	#region Bo Noise
	
	case "BN":
		add_palette(0, "", noone, "Bo Noise", "Only the Bo-est of Noises.", "");
		add_palette(2, "", noone, "Peppino", "The one and only...?");
		add_palette(3, "", noone, "Snick", "It's him...?", "PURPLE");
		add_palette(4, "", noone, "Bo Goise", "Kill Yourself", "UNWORTHY");
		add_palette(5, "", noone, "Inverted", "Ooo... scary...!");
		add_palette(6, "", noone, "Naked", "Wow. Yikes.");
		
		// Patterns
		add_palette(7, "funny", spr_peppattern1, "Funny Polka", "10 years behind bars for spamming Big Chungus.");
		add_palette(7, "itchy", spr_peppattern2, "Itchy Sweater", "Woven with Grandma's intestines.");
		add_palette(7, "pizza", spr_peppattern3, "Pizza Man", "I thought he... collected candy?");
		add_palette(7, "stripes", spr_peppattern4, "Bowling Stripes", "He committed genocide against RATS.");
		add_palette(7, "goldemanne", spr_peppattern5, "Goldemanne", "Thanks for the gold, kind stranger.");
		add_palette(7, "bones", spr_peppattern6, "Bad Bones", "Bad to the Noise.");
		add_palette(7, "pp", spr_peppattern7, "PP Shirt", "I'm trying really hard to laugh.");
		add_palette(7, "war", spr_peppattern8, "War Camo", "Every war had a distraction clown.");
		add_palette(7, "john", spr_peppattern9, "John Suit", "Genuinely, the concept of this is morbid.");
		add_palette(7, "", spr_pattern_trans, "Trans Flag", "Bo Noise says Tuc Rights!");
		add_palette(7, "", spr_pattern_missing, "Missing Texture", "Well, it's still playable.");
		add_palette(7, "", spr_pattern_minecraft_water, "Minecraft Water", "DO NOT drop it.");
		add_palette(7, "", spr_pattern_minecraft_lava, "Minecraft Lava", "How do you do this, anyway...?");
		add_palette(7, "", spr_pattern_dogma, "Dogma", "Feel the static cling.");
		add_palette(7, "", spr_pattern_giygas, "Giygas", "Quirky Earthbound-inspired RPG!");
		add_palette(7, "", spr_pattern_neoncandy, "Neon Candy", "Get that sugar rush.");
		add_palette(7, "", spr_pattern_nether, "Nether Portal", "Go to hell. In Minecraft.");
		add_palette(7, "", spr_pattern_snick, "Snick", "Didn't know SAGE had merch.");
		add_palette(7, "", spr_pattern_spheres, "Blue Spheres", "Still playing with balls?");
		add_palette(7, "", spr_pattern_warped, "Warped", "What's wrong with these trees?");
		add_palette(7, "", spr_pattern_hackerman, "Hackerman", "Welcome to the Matrix.");
		add_palette(7, "", spr_pattern_reddeath, "Red Death", "[FATAL ERROR]");
		add_palette(7, "", spr_pattern_livewire, "Livewire", "Light up the night.");
		add_palette(7, "", spr_pattern_mobius, "Mobius Strip", "Gotta' speed, Keed.");
		add_palette(7, "", spr_pattern_spaceinvader, "Space Invaders", "Invaders must die.");
		break;
	
	#endregion
}
pal_swap_index_palette(characters[sel.char][2]);
init = true;

// automatically select current palette
sel.pal = ((character == "P" or character == "SP" or character == "G") ? 1 : 0);

var pchar = obj_player1.character;
if pchar == "P"
{
	if obj_player1.isgustavo
		pchar = "G";
}

if instance_exists(obj_player1) && pchar == character
{
	var pal = obj_player1.paletteselect;
	for(var i = 0; i < array_length(palettes); i++)
	{
		if global.palettetexture != noone
		{
			if global.palettetexture == palettes[i].texture
			{
				sel.pal = i;
				if pal != 12
				{
					for(var j = 0; j < array_length(mixables); j++)
					{
						if pal == mixables[j].palette
							sel.mix = j;
					}
				}
			}
		}
		else if pal == palettes[i].palette
			sel.pal = i;
	}
}
