live_auto_call;

// cut everything out (temporary)
stop_music();
sound_stop_all();

open_menu();
con = 0;
fade = 0;

//720x400
surf = -1;
output = "";
input_mode = 0;
input = "";
blink = 0;
scroll = 0;
echo = true;

instructions = [];
instructionT = 0;
instructionF = -1;

draw_set_font(fnt_dos);
lineh = string_height("A");
keyboard_string = "";

#region FUNCS

function DOS_instruct(delay, func) {
	array_push(instructions, [delay, func]);
}
function DOS_initstate2()
{
	output += "\n";
	if echo
	{
		output += currentdir.ROOTNAME;
		output += ">";
	}
	input_mode = 1;
}
function DOS_initstate()
{
	// C:\>
	output += "\n";
	DOS_instruct(3, DOS_initstate2);
}
function DOS_command()
{
	output += input;
	input_mode = 0;
	
	if string_replace_all(input, " ", "") == ""
		DOS_initstate2();
	else
	{
		output += "\n";
		
		// process
		var args_raw = string_split_ext(input, [" ", "\\"], true, infinity);
		var args = [];
		
		for(var i = 0; i < array_length(args_raw); i++)
		{
			if string_pos(".", args_raw[i]) != 0
			{
				var fuck = string_split(args_raw[i], ".", false, infinity);
				for(var j = 0; j < array_length(fuck); j++)
				{
					if fuck[j] != ""
						array_push(args, fuck[j]);
					if j != array_length(fuck) - 1
						array_push(args, ".");
				}
			}
			else
				array_push(args, args_raw[i]);
		}
		
		switch string_lower(args[0])
		{
			#region INVALID
			
			default:
				var emptyhanded = true;
				for(var j = 0; j < array_length(currentdir.CONTENT); j++)
				{
					var file = currentdir.CONTENT[j];
					var filename = string_lower(file.NAME);
					
					var pos = string_pos(".", filename);
					if pos != 0
						filename = string_copy(filename, 1, string_pos(".", filename) - 1);
					
					if file.TYPE == 0 && filename == string_lower(args[0])
					{
						if is_method(file.FUNC)
						{
							input_mode = 0;
							file.FUNC();
						}
						emptyhanded = false;
					}
				}
				
				if emptyhanded
				{
					output += "Bad command or file name";
					output += "\n";
					DOS_instruct(3, DOS_initstate2);
				}
				break;
			
			#endregion
			#region CLS
			
			case "cls":
				output = "";
				DOS_instruct(3, DOS_initstate2);
				break;
			
			#endregion
			#region CD
			
			case "cd":
				var revert = currentdir;
				for(var i = 1; i < array_length(args); i++)
				{
					var cur = args[i], last = i == array_length(args) - 1;
					if cur == "." && !last && args[i + 1] == "."
					{
						if currentdir.DIR == -1
						{
							output += "Invalid directory\n";
							currentdir = revert;
							break;
						}
						else
							currentdir = currentdir.DIR;
					}
					else if cur == "."
					{
						// do nothing
					}
					else
					{
						var emptyhanded = true;
						for(var j = 0; j < array_length(currentdir.CONTENT); j++)
						{
							var file = currentdir.CONTENT[j];
							if file.TYPE == 1 && file.NAME == args[i]
							{
								currentdir = file;
								emptyhanded = false;
							}
						}
						
						if emptyhanded
						{
							output += "Invalid directory\n";
							currentdir = revert;
							break;
						}
					}
				}
				DOS_instruct(3, DOS_initstate2);
				break;
			
			#endregion
			#region HELP
			
			case "help":
				switch progression
				{
					default: output += "..."; break;
					case 0:
						output += "Hello";
						progression++;
						break;
					case 1:	
						output += "You know the mario brother";
						progression++;
						break;
					case 2: 
						output += "Trust me"; 
						progression++;
						break;
					case 3:
						output += "Listen there is a File you have to find do you understand";
						progression++;
						break;
					case 4:
						output += "Listen to ME";
						progression++;
						break;
					case 5:
						output += "Do you need you NEED to know the YEAR Super Mario Bros. on the\nNes released okay that is a FOLDER name you HAVE to go there";
						progression++;
						break;
					case 6:
					case 6.1:
						if currentdir.NAME == "1985"
						{
							output += "We're golden";
							progression = 7;
						}
						else
						{
							output += progression == 6 ? "Please do not ask me how to switch folders" : choose("Please", "I beg you", "For the love of god");
							progression = 6.1;
						}
						break;
					case 7:
						output += "Okay now LISTEN there is a File";
						progression++;
						break;
					case 8:
						output += "Very important file";
						progression++;
						break;
					case 9:
						output += "You need to RUN this file Okay Run it";
						progression++;
						break;
					case 10:
						output += "The file name is";
						progression++;
						break;
					case 11:
						output += "marior";
						progression++;
						break;
					case 12:
						output += "RUN the marior file NOW";
						break;
				}
				output += "\n";
				DOS_instruct(3, DOS_initstate2);
				break;
			
			#endregion
			#region ECHO
			
			case "echo":
				if array_length(args) == 2 && args[1] == "on"
					echo = true;
				else if array_length(args) == 2 && args[1] == "off"
					echo = false;
				else if array_length(args) > 1
				{
					for(var i = 1; i < array_length(args); i++)
						output += args[i] + " ";
					output += "\n";
				}
				else
					output += "ECHO is " + (echo ? "on" : "off") + "\n";
				DOS_instruct(3, DOS_initstate2);
				break;
			
			#endregion
			#region DIR
			
			case "dir":
				output += "No\n";
				DOS_instruct(3, DOS_initstate2);
				break;
			
			#endregion
		}
	}
	input = "";
}
function DOS_directory(name)
{
	return {TYPE: 1, NAME: name, CONTENT: [], DIR: -1, ROOTNAME: name + "\\"};
}
function DOS_adddir(file, dir)
{
	file.ROOTNAME = dir.ROOTNAME + file.ROOTNAME;
	file.DIR = dir;
	array_push(dir.CONTENT, file);
}
function DOS_file(dir, name, func)
{
	var file = {TYPE: 0, NAME: name, FUNC: func,
		DATE: 0, SIZE: 0};
	array_push(dir.CONTENT, file);
	return file;
}
self.DOS_instruct = DOS_instruct;
self.DOS_initstate = DOS_initstate;
self.DOS_command = DOS_command;

#endregion

DOS_instruct(50, function() {output = "Starting MB-ROS...";});
DOS_instruct(100, DOS_initstate);

#region FOLDER STRUCTURE

root = DOS_directory("C:");

var folder = DOS_directory("1985");
DOS_adddir(folder, root);

var mario = DOS_file(folder, "marior", function()
{
	output = "";
	
	var lag = 3;
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@%%%%#&%%%%##(((#%%%%%&%%%%%@@@@@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@%%%&((###############((%%%%@@@@@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@#(#######..	, *%######(%@@@@@@@@@@@@@@@&@@&@@@&@@@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@/(#######. ,(#(/(#(...%%%%%####@@@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&@&&&&&&&&&&/(########/./##  % .##*.%%%%%%%%##%@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&&&&&&&&&&(######%%%%%/.%.....,,%.%%%%%%%%%%%#(&&&&&&&&&&&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&&&&&&&&&(#####%%%%%##((#############%%%%%%%%%#(&&&&&&&&&&&@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@%%%%%%%%%%%(####%%#%%%%%%%%%%%%%%%%%%%%%%%%%#&%%%%#(%%%%%%%%%%&&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@%%%%%%%%%%#(##%#%%%%&@@@@@%/////////@@@@@@%%%%%#%%##%%%%%%%%%%%@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@%%%%%%%%%%(###%%%((/@*|***#@*******@|**//(@/((&%%%%#%%%%%%%%%%%@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@&&&&&&&&&&&(#%%#,,***/,..#%#,,,,,**%%#,*/|****%&&%%(%%%%%%%%%%&@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@ ..,##,...,  %/# %*..,,,#% %//,*****&&%|**(&&&&&&&&&&@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@###########.***,##%....  #(%&*.......(%&|*,*,,*,&&#**///##########@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@&##########,,,**#% ....... ............,,,,,,*,,/&%(**/#%%%%%%%%%%@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@&&&&&&&&&&&..,.&../%%&@#,..........,,,,,*%&&&&**/#/|**&&&&&&&&&&&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@,.....*&&&%%%*,,,,,,,,,,,**&@@&&&@**.***#@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@%#* .,,**&&&&&(*********&@@@@&*****.*%&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@%#&&.,,,,,,*/,%&@@@@@@@@(/(*******,&&&&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@@@@@@@**,,,,..,,,,,*************/&@@@@@@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@&%%%%#%(&&|**,,,...,********(&%#%%%%%%&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@&%(########%@&&(***////#&&&&&%%%%%%%%%&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@&############&#####%%&&&&&&&%%%%%%%%%%%#@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@%#######%######&############%%%%&%%%%%%%%%%%@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@########%%#.....(%##############....,(%&&&%%%%%%@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@&&&&&&&&&&%######%%%%(#....*#%##############%.,,,*%#&&&&%%%%%#&&&&&&&&&&&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@%######%%%%%(#####%&(################&##%%%%%&&&&%%##%%#@@@@@@@@@@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@#%&#######%%%&@#(###############################%%&&&%%###%%%(@#%@@@@@@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&&&@	  ##%%%&&@########################%%%%#%#####%&@&%%%##*	. @&&&&&&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@%,	  ...,&&&&&##############################%%%%%%%@&%%(		  (&@&@@@@@@\n";});
	DOS_instruct(lag, function() {output += "@@@&		 ..,*/(@&&#######################%%%%%%%%%%%%%#&&@...		  .*#@@@\n";});
	DOS_instruct(lag, function() {output += "&&		 .....,(%&&&#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@/.			..,&@@@@\n";});
	DOS_instruct(lag, function() {output += "%		 .......*%&%%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%&&,			 .../@@@\n";});
	DOS_instruct(lag, function() {output += "*	   ...*//,..,(&&%%(##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%##.  .*/,.	....,,@@\n";});
	DOS_instruct(lag, function() {output += "@ .........*/.,..,/%%&%#######%%%%%&%%%%%%%%%&%%%%%%%%%%%%&&#%...,	  ..**,***@@\n";});
	DOS_instruct(lag, function() {output += "@@@,,..,...,,//.**@@%%(#########%%%%&&&%%&&&&%%%%######%%%#&&@@,,*/. ...*|***(@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&%(,**(%%%(###@%%%###########%%%&&%&&&&&%##########%%%%&&%@%###%%%|***(%&@@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&%%%%%%%%%(##%%%%(###########%%%&&%&%%%%############%%%%%%%&###%%%%#%%%%&@@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&%%%%%%%%%(%%%%%%(##########%%%%&%%%%%%%############%%%#&&&&&&#%%%%#%%%%&@@@\n";});
	DOS_instruct(lag, function() {output += "&@&&&%%%%%%%%%%%%%%%############%%%%&%&&%%%##############%%%%%%%%%%%%%%#%%%%&@&@\n";});
	DOS_instruct(lag, function() {output += "&@&@@#%%%%&&&&&&&&&&(##########%%%%%%&&&&&&%#############%%%#&&&&&&&&&%#%%%%@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@&&&&&&&&&&############%%%%%%&&&%%%%##############%%#&&&&&&&&&&%@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@%%%%%%%%%%&(##########%%%%%%&&&&%%%%###############%%#&&&&&&&&&&&@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@@@@@@&@@@############%%%%%%&&&&&&&&&###############%%&@@@&@@@@@@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@@@@@@&%(*//((###%%###%%%%%%&&&&&&&&&#########%###(((/|*%%&@@@@@@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@@@@@(////////(((####%%%%%%%%%%%&&&&#####%#((((((///////(/(&@@@@@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&&&&&&&&&&////|****/((((###%%%%%%#%%%%%%%%%((((((((((|***////(((((%&&&&&&&&&&@\n";});
	DOS_instruct(lag, function() {output += "&&&&&&&&&&&&/(((((///(((((####%####(&&&&&&&&&((((((((((((//(((((((##(%%%%%%%%%%&\n";});
	DOS_instruct(lag, function() {output += "&@&&&&&&&&&&#((((((((#######%#####/////////////####((((((((((#######&&&&&&&&&&&@\n";});
	DOS_instruct(lag, function() {output += "&@@#((((((((((/#%%%%%%%%%%%#(((&%%&&&&&&@@@@@@%%%#,*/#%%%%%%%%%%%#/((((((((((%@@\n";});
	repeat 10
		DOS_instruct(lag, function() {output += "\n";});
	DOS_instruct(lag, function() {output = "";});
	DOS_instruct(100, function() {output = "Congratulation\n";});
	DOS_instruct(100, function() {output += "Press any key to continue . . .\n"; input_mode = 2;});
});
mario.SIZE = 64;
mario.DATE = date_create_datetime(1985, 8, 13, 0, 0, 0);

trace(root);

#endregion

currentdir = root;
progression = 0;

with obj_shell
	WC_bindsenabled = false;
