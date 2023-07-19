live_auto_call;

if sugary
{
	alarm[3] = 0;
	
	if floor(image_index) == image_number - 3
	{
		if global.rank == "d"
		{
			obj_endlevelfade.rank = 1;
			setcolors(109, 121, 134, 84, 87, 99);
		}
		if global.rank == "c"
		{
			obj_endlevelfade.rank = 2;
			setcolors(103, 190, 84, 67, 122, 28);
		}
		if global.rank == "b"
		{
			obj_endlevelfade.rank = 3;
			setcolors(121, 159, 221, 51, 95, 196);
		}
		if global.rank == "a"
		{
			obj_endlevelfade.rank = 4;
			setcolors(178, 78, 78, 99, 43, 29);
		}
		if global.rank == "s"
		{
			obj_endlevelfade.rank = 5;
			setcolors(182, 116, 25, 143, 83, 0);
		}
		if global.rank == "p"
		{
			obj_endlevelfade.rank = 5;
			if obj_player1.character == "SP"
				setcolors(188, 108, 143, 134, 40, 66);
			else
				setcolors(152, 80, 248, 80, 0, 184);
		}
		
		with obj_endlevelfade
		{
			with instance_create(0, 0, obj_flash)
				depth = other.depth - 1;
		}
	}
}

if floor(image_index) == image_number - 1
	image_speed = 0;

if (global.collect >= global.collectN)
{
	if (obj_player1.character == "P")
	{
		if (global.rank == "s")
			sprite_index = spr_rankS;
		if (global.rank == "a")
			sprite_index = spr_rankA;
		if (global.rank == "b")
			sprite_index = spr_rankB;
		if (global.rank == "c")
			sprite_index = spr_rankC;
		if (global.rank == "d")
			sprite_index = spr_rankD;
		if (global.rank == "p")
			sprite_index = spr_rankP;
	}
	else if obj_player1.character == "SP"
	{
		if (global.rank == "s")
			sprite_index = spr_rankSPS;
		if (global.rank == "a")
			sprite_index = spr_rankSPA;
		if (global.rank == "b")
			sprite_index = spr_rankSPB;
		if (global.rank == "c")
			sprite_index = spr_rankSPC;
		if (global.rank == "d")
			sprite_index = spr_rankSPD;
		if (global.rank == "p")
			sprite_index = spr_rankSPP;
	}
	else if check_char("BN")
	{
		if (global.rank == "s")
			sprite_index = spr_rankBNS;
		if (global.rank == "a")
			sprite_index = spr_rankBNA;
		if (global.rank == "b")
			sprite_index = spr_rankBNB;
		if (global.rank == "c")
			sprite_index = spr_rankBNC;
		if (global.rank == "d")
			sprite_index = spr_rankBND;
		if (global.rank == "p")
			sprite_index = spr_rankBNP;
	}
	else
	{
		if (global.rank == "s")
			sprite_index = spr_rankNS;
		if (global.rank == "a")
			sprite_index = spr_rankNA;
		if (global.rank == "b")
			sprite_index = spr_rankNB;
		if (global.rank == "c")
			sprite_index = spr_rankNC;
		if (global.rank == "d")
			sprite_index = spr_rankND;
		if (global.rank == "p")
			sprite_index = spr_rankP;
	}
}
if (brown)
{
	brownfade = Approach(brownfade, 1, 0.07);
	
	if sugary
	{
		if event == 0
		{
			fmod_event_instance_play(sugaryrank);
			event = 1;
		}
		
		if (obj_player1.key_jump or obj_player1.key_slap2) && event == 1
		{
			event = 2;
			event_perform(ev_alarm, 0);
		}
		
		clipy = Approach(clipy, 0, 25 - accel);
		accel = Approach(accel, 24, 0.4);
		
		if clipy <= 270 && event == 1
		{
			if global.rank == "p" && obj_player1.character != "BN"
				x = Approach(x, 220, 25 - accel);
			else if obj_player1.character != "SP"
				x = Approach(x, 420, 3);
		}
	}
	else
	{
		switch (toppin_state)
		{
			case states.jump:
				if (brownfade < 1)
					break;
				else
				{
					var spd = 20;
					var yy = (obj_screensizer.actual_height - 62);
					toppin_y[toppin_index] -= spd;
					toppin_yscale[toppin_index] = 1.2;
					if (toppin_y[toppin_index] <= yy)
					{
						if (toppin[toppin_index] == 1)
						{
							createmoney[toppin_index] = 1;
							if toppinvisible
								sound_play_3d("event:/sfx/misc/kashing", (room_width / 2), (room_height / 2));
						}
						if toppinvisible
							sound_play_3d("event:/sfx/misc/toppingot", (room_width / 2), (room_height / 2));
						toppin_y[toppin_index] = yy;
						toppin_state = states.transition;
						brown = 1;
					}
					break;
				}
			case states.transition:
				toppin_yscale[toppin_index] = Approach(toppin_yscale[toppin_index], 1, 0.1);
				if (toppin_yscale[toppin_index] == 1)
				{
					toppin_index++;
					if (toppin_index >= array_length(toppin))
					{
						toppin_state = states.normal;
						alarm[3] = 40;
					}
					else
						toppin_state = states.jump;
				}
				break;
		}
	}
}
if (instance_exists(obj_treasureviewer))
	visible = false;
