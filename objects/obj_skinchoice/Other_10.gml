live_auto_call;

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
		
		add_palette(16, "", noone, "Gameboy Color", "What a ripoff.");
		add_palette(17, "", noone, "XMAS", "Give me a break.", "MERRY");
		add_palette(18, "", noone, "The Noise", "...woag?");
		add_palette(19, "", noone, "Anton", "Get ready to play with his balls.", "ANTON");
		add_palette(20, "", noone, "Unfinished", "I found a hole in this sprite");
		add_palette(21, "", noone, "Aether", "Did we find a coder yet?");
		add_palette(22, "", noone, "Black", "I'll get back to that one.", "BLACK");
		add_palette(23, "", noone, "Bonmario", "Property of Bonmario of America INC.");
		add_palette(24, "", noone, "Drunken", "Don't do drugs or you'll turn purple!", "DRUNK");
		add_palette(25, "", noone, "Virtual Boy", "Comical success.");
		add_palette(26, "", noone, "Frostbite", "Lesson learned, don't bathe in a freezer.", "FROZEN");
		add_palette(27, "", noone, "Dark Gray", "Depresso spaghetto.", "DARK");
		add_palette(28, "", noone, "Speed Demon", "You're quick as hell!", "SPEEDY");
		add_palette(29, "", noone, "Blazing Heat", "Stings like a bad curry.", "HEATED");
		add_palette(30, "", noone, "Bread Winner", "Let's get that dough.", "INTERN");
		add_palette(31, "", noone, "Cheesed Up", "This can't brie happening.", "CHEESY");
		add_palette(32, "", noone, "Chalk Eater", "Barney? Is that you?", "MEAN");
		add_palette(33, "", noone, "Snottino", "Picked and flicked.", "SNOTTY");
		add_palette(34, "", noone, "Majin", "Fun is Infinite.", "MAJIN");
		add_palette(35, "", noone, "Brulo", "Anton's gonna be PISSED.", "BRULO");
		add_palette(36, "", noone, "Super Meat Boy", "Push the buttons.", "MEATY");
		add_palette(37, "", noone, "Creamsicle", "Stay frosty out there.", "CREAMY");
		add_palette(38, "", noone, "So Retro", "Batteries sold separately.", "RETRO");
		add_palette(39, "", noone, "Lean", "Jokes have a lifespan.", "LEAN");
		add_palette(40, "", noone, "Grinch", "Have I truly become a monster?", "GRINCH");
		add_palette(41, "", noone, "Monster Mash", "Rise from your grave.", "ZOMBIFIED");
		add_palette(42, "", noone, "Kirby", "Defender of Planet Popstar.", "PINK");
		add_palette(43, "", noone, "Purple Pro", "It's not a Snick reference.", "PURPLE");
		add_palette(44, "", noone, "Bold And Brash", "More like, belongs in the trash.", "BOLD");
		add_palette(45, "", noone, "Fallen Down", "Mt. Ebbot 201x.", "SEPIA");
		add_palette(46, "", noone, "Sketch", "You seem rather pale.", "PALE");
		add_palette(47, "", noone, "Dead Meat", "That sucks.");
		add_palette(48, "", noone, "Warzone", "Deploying tactical italian.", "WORN");
		add_palette(49, "", noone, "Block Party", "The pillars of the community.", "PILLAR");
		add_palette(50, "", noone, "Machine Code", "Hack the planet.", "HACKER");
		add_palette(51, "", noone, "Button Masher", "Don't blame the controller.");
		add_palette(52, "", noone, "Orange Juice", "Hey Apple", "ORANGE");
		add_palette(53, "", noone, "Pasta Power", "The princess is in another castle.", "JUMPMAN");
		add_palette(54, "", noone, "Sucrose Snowstorm", "A little sweetness never hurts.", "SWEET");
		add_palette(55, "", noone, "Peter", "Griffin");
		
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
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
		
		add_palette(16, "", noone, "Gameboy Color", "What a ripoff.");
		add_palette(17, "", noone, "XMAS", "Give me a break.", "MERRY");
		add_palette(18, "", noone, "The Noise", "...woag?");
		add_palette(19, "", noone, "Anton", "Get ready to play with his balls.", "ANTON");
		add_palette(20, "", noone, "Unfinished", "There are more holes than a block of cheese on this guy.");
		add_palette(21, "", noone, "Aether", "Did we find a coder yet?");
		add_palette(22, "", noone, "Black", "I'll get back to that one.", "BLACK");
		add_palette(23, "", noone, "Bonmario", "Property of Bonmario of America INC.");
		add_palette(24, "", noone, "Drunken", "Don't do drugs or you'll turn purple!", "DRUNK");
		add_palette(25, "", noone, "Virtual Boy", "Comical success.");
		add_palette(26, "", noone, "Freezer Burn", "Worry not, the rat IS harmed.", "FROZEN");
		add_palette(27, "", noone, "Dark Gray", "Hello darkness, my old friend...", "DARK");
		add_palette(28, "", noone, "Speed Demon", "You're quick as hell!", "SPEEDY");
		add_palette(29, "", noone, "Blazing Heat", "Stings like a bad curry.", "HEATED");
		add_palette(30, "", noone, "Bread Winner", "Let's get that dough.", "INTERN");
		add_palette(31, "", noone, "Cheesed Up", "This can't brie happening.", "CHEESY");
		add_palette(32, "", noone, "Chalk Eater", "Barney? Is that you?", "MEAN");
		add_palette(33, "", noone, "Snottino", "Picked and flicked.", "SNOTTY");
		add_palette(34, "", noone, "Majin", "Fun is Infinite.", "MAJIN");
		add_palette(35, "", noone, "Brulo", "Anton's gonna be PISSED.", "BRULO");
		add_palette(36, "", noone, "Super Meat Boy", "Push the buttons.", "MEATY");
		add_palette(37, "", noone, "Creamsicle", "Stay frosty out there.", "CREAMY");
		add_palette(38, "", noone, "So Retro", "Batteries sold separately.", "RETRO");
		add_palette(39, "", noone, "Gabaghoul", "Grains Graains.", "GHOULISH");
		add_palette(40, "", noone, "Grinch", "Have I truly become a monster?", "GRINCH");
		add_palette(41, "", noone, "Monster Mash", "Rise from your grave.", "ZOMBIFIED");
		add_palette(42, "", noone, "Dreamland Duo", "Defenders of Planet Popstar.", "PINK");
		add_palette(43, "", noone, "Purple Pros", "It's not a Snick reference.", "PURPLE");
		add_palette(44, "", noone, "Bold And Brash", "More like, belongs in the trash.", "GRAYISH");
		add_palette(45, "", noone, "Fallen Down", "Mt. Ebbot 201x.", "SEPIA");
		add_palette(46, "", noone, "Sketch", "You seem rather pale.", "PALE");
		add_palette(47, "", noone, "Dead Meat", "May contain traces of rat.");
		add_palette(48, "", noone, "Warzone", "Deploying tactical italian.", "DISGUISED");
		add_palette(49, "", noone, "Block Party", "The pillars of the community.", "PILLAR");
		add_palette(50, "", noone, "Machine Code", "Hack the planet.", "HACKER");
		add_palette(51, "", noone, "Button Masher", "Don't blame the controller.");
		add_palette(52, "", noone, "Aperture Science", "Start thinking with portals.", "APERTURE");
		add_palette(53, "", noone, "Pasta Power", "The princess is in another castle.", "JUMPMAN");
		add_palette(54, "", noone, "Sucrose Snowstorm", "A little sweetness never hurts.", "SWEET");
		
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
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
		add_palette(7, "", noone, "The Groise", "Piss Chuggers Association.");
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
		add_palette(24, "", noone, "Concept", "The original.");
		add_palette(25, "", noone, "Chungus", "Big");
		
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
		break;
	
	#endregion
	#region Pizzelle
	
	case "SP":
		add_palette(0, "", noone, "Yellow", "Take the first 4 letters of his name.");
		add_palette(1, "", noone, "Pizzelle", "It's the Candy-making patisje!", "");
		add_palette(2, "", noone, "Sugar", "Obviously sugar is green.");
		add_palette(3, "", noone, "Familiar Gremlin", "Something's wrong.");
		add_palette(4, "", noone, "Massacre", "SUGARY SPIRE 2: The Quest for Diabetes.");
		add_palette(5, "", noone, "Rivals", "Did we find a coder yet?");
		add_palette(6, "", noone, "Gum", "Don't actually chew him, please.");
		add_palette(7, "", noone, "Old School", "Also known as... grayscale.", "GRAYSCALE");
		add_palette(8, "", noone, "Zombified", "Ricochet, eh? I sense some inspiration-ception.");
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
		break;
	
	#endregion
	#region Bo Noise
	
	case "BN":
		add_palette(0, "", noone, "Bo Noise", "Only the Bo-est of Noises.", "");
		add_palette(2, "", noone, "Peppino", "The one and only...?");
		add_palette(3, "", noone, "Snick", "It's him...?", "PURPLE");
		add_palette(4, "", noone, "Grinch", "IIIIIIT'S CHRIMMAAAAAAAA", "GRINCH");
		add_palette(5, "", noone, "Inverted", "Ooo... scary...!");
		add_palette(6, "", noone, "Naked", "Wow. Yikes.");
		add_palette(7, "", noone, "The Groise", "Piss Chuggers Association.");
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
		add_palette(24, "", noone, "Concept", "The original.");
		
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
		add_palette(12, "", spr_pattern_mario, "Mario", "My favorite plumber merch.");
		break;
	
	#endregion
	#region Pinolino
	
	case "PN":
		var desc = "Oh my god, I'm HUMPING MY COUCH!";
		
		add_palette(0, "yellow", noone, "Yellow", "do not use");
		add_palette(1, "classic", noone, "Pinolino", desc);
		add_palette(3, "unfunny", noone, "Unfunny", "that's just your opinion");
		add_palette(4, "money", noone, "Money Green", "MONEY! GOODY!");
		add_palette(5, "sage", noone, "Sage Blue", "pino of the sky");
		add_palette(6, "blood", noone, "Blood Red", "don't kill bloody");
		add_palette(7, "tv", noone, "TV Purple", "pinolino showcase!");
		add_palette(8, "dark", noone, "Dark", "ok");
		add_palette(9, "shitty", noone, "Shitty", "HOH SIS! WE DO THE JOJ");
		add_palette(10, "golden", noone, "Golden God", "GOLDY GOODY YEAHY");
		add_palette(11, "garish", noone, "Garish", "pritty pino pin pink");
		add_palette(15, "mooney", noone, "Mooney Orange", "not annoying");
		
		add_palette(16, "", noone, "Gameboy Color", desc);
		add_palette(17, "", noone, "XMAS", desc, "FUCKED UP");
		add_palette(18, "", noone, "The Noise", desc);
		add_palette(19, "", noone, "Anton", desc, "FUCKED UP");
		add_palette(20, "", noone, "Unfinished", desc);
		add_palette(21, "", noone, "Aether", desc);
		add_palette(22, "", noone, "Black", desc, "FUCKED UP");
		add_palette(23, "", noone, "Bonmario", desc);
		add_palette(24, "", noone, "Drunken", desc, "FUCKED UP");
		add_palette(25, "", noone, "Virtual Boy", desc);
		add_palette(26, "", noone, "Frostbite", desc, "FUCKED UP");
		add_palette(27, "", noone, "Dark Gray", desc, "FUCKED UP");
		add_palette(28, "", noone, "Speed Demon", desc, "FUCKED UP");
		add_palette(29, "", noone, "Blazing Heat", desc, "FUCKED UP");
		add_palette(30, "", noone, "Bread Winner", desc, "FUCKED UP");
		add_palette(31, "", noone, "Cheesed Up", desc, "FUCKED UP");
		add_palette(32, "", noone, "Chalk Eater", desc, "FUCKED UP");
		add_palette(33, "", noone, "Snottino", desc, "FUCKED UP");
		add_palette(34, "", noone, "Majin", desc, "FUCKED UP");
		add_palette(35, "", noone, "Brulo", desc, "FUCKED UP");
		add_palette(36, "", noone, "Super Meat Boy", desc, "FUCKED UP");
		add_palette(37, "", noone, "Creamsicle", desc, "FUCKED UP");
		add_palette(38, "", noone, "So Retro", desc, "FUCKED UP");
		add_palette(39, "", noone, "Lean", desc, "FUCKED UP");
		add_palette(40, "", noone, "Grinch", desc, "FUCKED UP");
		add_palette(41, "", noone, "Monster Mash", desc, "FUCKED UP");
		add_palette(42, "", noone, "Kirby", desc, "FUCKED UP");
		add_palette(43, "", noone, "Purple Pro", desc, "FUCKED UP");
		add_palette(44, "", noone, "Bold And Brash", desc, "FUCKED UP");
		add_palette(45, "", noone, "Fallen Down", desc, "FUCKED UP");
		add_palette(46, "", noone, "Sketch", desc, "FUCKED UP");
		add_palette(47, "", noone, "Dead Meat", desc);
		add_palette(48, "", noone, "Warzone", desc, "FUCKED UP");
		add_palette(49, "", noone, "Block Party", desc, "FUCKED UP");
		add_palette(50, "", noone, "Machine Code", desc, "FUCKED UP");
		add_palette(51, "", noone, "Button Masher", desc);
		add_palette(52, "", noone, "Orange Juice", desc, "FUCKED UP");
		add_palette(53, "", noone, "Pasta Power", desc, "FUCKED UP");
		add_palette(54, "", noone, "Sucrose Snowstorm", desc, "FUCKED UP");
		add_palette(55, "", noone, "Homero", "Simpson");
		
		// Patterns
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "LOL LMFA");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "poisin ivey");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "a piza.. towor?");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "it look like cokonaut");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "GOODY GOODY DOOGY FFFFFF");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "my");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "pinolino's pizz");
		add_palette(12, "war", spr_peppattern8, "War Camo", "NEW");
		add_palette(12, "john", spr_peppattern9, "John Suit", "What the fuck is a gog?");
		add_palette(12, "", spr_pattern_trans, "Trans Flag", "Trans Rizz");
		add_palette(12, "", spr_pattern_missing, "Missing Texture", "I know you like d");
		add_palette(12, "", spr_pattern_dogma, "Dogma", "w");
		add_palette(12, "", spr_pattern_giygas, "Giygas", "sccary ramen!");
		add_palette(12, "", spr_pattern_neoncandy, "Neon Candy", "IM FEELING SUGGARY!");
		add_palette(12, "", spr_pattern_nether, "Nether Portal", "go to");
		add_palette(12, "", spr_pattern_snick, "Snick", "whar");
		add_palette(12, "", spr_pattern_spheres, "Blue Spheres", "funnies sonic turbo");
		add_palette(12, "", spr_pattern_warped, "Warped", "crash 3:");
		add_palette(12, "", spr_pattern_hackerman, "Hackerman", "im ddo the codes");
		add_palette(12, "", spr_pattern_reddeath, "Red Death", "why is dead");
		add_palette(12, "", spr_pattern_livewire, "Livewire", "wire is not alive");
		add_palette(12, "", spr_pattern_mobius, "Mobius Strip", "i will conker mobiusa with this strip.");
		add_palette(12, "", spr_pattern_spaceinvader, "Space Invaders", "so... re...so retr... so...");
		add_palette(12, "", spr_pattern_mario, "Mario", "brother");
		break;
	
	#endregion
	#region Pizzano
	
	case "SN":
		add_palette(1, "", noone, "Pizzano", "The voice of the people.", "");
		break;
	
	#endregion
}
pal_swap_index_palette(characters[sel.char][2]);
init = true;

// automatically select current palette
sel.pal = ((character == "P" or character == "SP" or character == "G" or character == "PN") ? 1 : 0);

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
