live_auto_call;

if keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))
	room_restart();
if keyboard_check_pressed(vk_escape)
{
	obj_player1.state = states.normal;
	instance_destroy();
}

// input
if input_mode == 0
{
	blink = 0;
	input = "";
	
	if !safe_get(obj_shell, "isOpen")
		keyboard_string = "";
}
else
{
	keyboard_string = string_copy(keyboard_string, 1, 75);
	keyboard_string = string_replace_all(keyboard_string, "^", "");
	
	if input_mode == 2 && keyboard_lastchar != ""
	{
		obj_player1.state = states.normal;
		instance_destroy();
	}
	else
	{
		var lastchar = ord(keyboard_lastchar);
		keyboard_lastchar = "";
	
		// cancel command
		if lastchar == 127 or lastchar == 3
		{
			output += input + "^C";
			input = "";
			input_mode = 0;
			DOS_instruct(3, DOS_initstate);
		}
	
		// go
		else if lastchar == 13
		{
			output += input;
			DOS_command();
			input = "";
		}
		
		else
			input = keyboard_string;
	}
}

// instructions
if instructionT > 0
	instructionT--;
else
{
	if is_callable(instructionF)
	{
		instructionF();
		instructionF = -1;
	}
	
	var pop = array_shift(instructions);
	if pop != undefined
	{
		instructionT = pop[0];
		instructionF = pop[1];
		trace(pop);
	}
}
