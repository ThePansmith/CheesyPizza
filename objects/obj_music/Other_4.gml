if (!global.panic or global.leveltosave == "dragonlair" or global.leveltosave == "grinch")
{
	var mu = ds_map_find_value(music_map, room);
	if (!is_undefined(mu))
	{
		var prevmusic = music;
		if (prevmusic == -4 || mu.event_name != prevmusic.event_name)
		{
			fmod_event_instance_play(mu.event);
			fmod_event_instance_set_paused(mu.event, false);
			if (mu.continuous && prevmusic != -4)
			{
				var pos = fmod_event_instance_get_timeline_pos(prevmusic.event);
				pos = music_get_pos_wrap(pos, fmod_event_get_length(mu.event_name));
				fmod_event_instance_set_timeline_pos(mu.event, pos);
			}
			if (prevmusic != -4)
			{
				if (room == Mainmenu)
					fmod_event_instance_stop(prevmusic.event, false);
				else
					fmod_event_instance_stop(prevmusic.event, true);
				if (prevmusic.event_secret != -4)
					fmod_event_instance_stop(prevmusic.event_secret, true);
			}
			music = mu;
			savedmusicpos = 0;
			if (room == war_1 || room == tower_finalhallway)
				fmod_event_instance_stop(music.event, true);
		}
	}
	if (instance_exists(obj_hungrypillar))
	{
		fmod_event_instance_play(pillarmusicID);
		fmod_set_parameter("pillarfade", 0, true);
	}
	else
		fmod_event_instance_stop(pillarmusicID, true);
	if (music != -4 && music.on_room_start != -4)
		music.on_room_start(room, music.event, music.event_secret);
}
if (secret)
{
	if (music != -4 && music.event_secret != -4)
	{
		var ev = music.event_secret, evname = music.event_secret_name;
		
		// secrets
		if obj_player1.character == "SP"
			fmod_event_instance_set_parameter(ev, "state", 1, true);
		else if obj_player1.character == "BN"
			fmod_event_instance_set_parameter(ev, "state", 2, true);
		else if obj_player1.character == "PP" && room != tower_soundtest
		{
			ev = pissinosecretID;
			evname = "event:/modded/pissinosecret";
			
			fmod_event_instance_set_parameter(ev, "state", global.panic ? 20 : 0, true);
		}
		else
			fmod_event_instance_set_parameter(ev, "state", 0, true);
		
		// start playing or resume secret song
		fmod_event_instance_play(ev);
		fmod_event_instance_set_paused(ev, false);
		pos = fmod_event_instance_get_timeline_pos(music.event);
		savedmusicpos = pos;
		pos = music_get_pos_wrap(pos, fmod_event_get_length(evname));
		fmod_event_instance_set_timeline_pos(ev, pos);
		fmod_event_instance_set_paused(music.event, true);
	}
	if (global.panic)
	{
		trace("Pausing panic music: room_start");
		savedpanicpos = fmod_event_instance_get_timeline_pos(panicmusicID);
		fmod_event_instance_set_paused(panicmusicID, true);
	}
}
else if (secretend)
{
	secretend = false;
	if (music != -4)
	{
		fmod_event_instance_stop(pissinosecretID, true);
		fmod_event_instance_stop(music.event_secret, true);
		fmod_event_instance_set_paused(music.event, false);
		fmod_event_instance_set_timeline_pos(music.event, savedmusicpos);
	}
	if (global.panic)
	{
		fmod_event_instance_set_timeline_pos(panicmusicID, savedpanicpos);
		fmod_event_instance_set_paused(panicmusicID, false);
		trace("Resuming panic music: room_start");
	}
}
if (room == rank_room || room == boss_pizzaface || room == boss_noise || room == boss_vigilante || room == boss_fakepep || room == boss_pepperman)
{
	if (music != -4)
	{
		fmod_event_instance_stop(music.event, true);
		fmod_event_instance_stop(music.event_secret, true);
		fmod_event_instance_stop(pissinosecretID, true);
	}
}
