if global.jukebox != noone
{
	if music != noone
	{
		fmod_event_instance_stop(music.event, true);
		fmod_event_instance_release(music.event, true);
	}
	music = noone;
	exit;
}
if waiting && !safe_get(obj_pause, "pause")
{
	waiting = false;
	event_perform(ev_other, ev_room_start);
}
if warstart && !(MOD.DeathMode or global.jukebox != noone)
{
	fmod_event_instance_play(music.event);
	warstart = false;
}

prevpillar_on_camera = pillar_on_camera;
if (fmod_event_instance_is_playing(kidspartychaseID) && instance_exists(obj_pause) && !obj_pause.pause && !instance_exists(obj_monster))
{
	trace("Stopping kidsparty music");
	fmod_event_instance_stop(kidspartychaseID, false);
	instance_destroy(obj_kidspartybg);
	if current_custom != noone && instance_exists(obj_levelLoader)
	{
		var song = custom_music[current_custom];
		if song.fmod
			fmod_event_instance_set_paused(song.instance, savedmusicpause);
		else if !savedmusicpause
			audio_resume_sound(song.instance);
	}
	else if (music != noone)
	{
		fmod_event_instance_set_paused(music.event, savedmusicpause);
		fmod_event_instance_set_paused(music.event_secret, savedsecretpause);
	}
	fmod_event_instance_set_paused(pillarmusicID, savedpillarpause);
	fmod_event_instance_set_paused(panicmusicID, savedpanicpause);
}

// pillarfade
if instance_exists(obj_hungrypillar)
{
	fmod_event_instance_set_paused(pillarmusicID, false);
	fmod_event_instance_set_parameter(pillarmusicID, "state", SUGARY ? 20 : 0, true);
	
	var p = false;
	with (obj_hungrypillar)
	{
		if (bbox_in_camera(view_camera[0], 0))
			p = true;
	}
	if (p != pillar_on_camera)
		pillar_on_camera = p;
}
else
	pillar_on_camera = false;
if prevpillar_on_camera != pillar_on_camera
	fmod_set_parameter("pillarfade", pillar_on_camera, false);

if !safe_get(obj_pause, "pause") && instance_exists(obj_player1)
{
	if (global.panic && global.leveltosave != "dragonlair" && global.leveltosave != "grinch" && global.leveltosave != "sucrose")
	or ((global.snickchallenge or MOD.DeathMode) && !instance_exists(obj_titlecard))
	{
		if !panicstart
		{
			destroy_sounds([panicmusicID]);
			
			if global.snickchallenge
				panicmusicID = fmod_event_create_instance("event:/modded/level/snickchallenge");
			else if MOD.DeathMode
				panicmusicID = fmod_event_create_instance("event:/modded/deathmode");
			else
			{
				var char = obj_player1.character;
				switch char
				{
					default: panicmusicID = fmod_event_create_instance("event:/music/pizzatime"); break;
					case "N": 
					case "V": 
					case "S": 
					case "SP":
					case "BN":
					case "PN":
					case "SN":
						panicmusicID = fmod_event_create_instance($"event:/music/pizzatime{obj_player1.character}");
						break;
				}
			}
			cyop_freemusic();
			
			trace("Starting panic music: step");
			panicstart = true;
			if (room != tower_finalhallway or MOD.DeathMode)
			{
				fmod_event_instance_play(panicmusicID);
				fmod_event_instance_set_paused(panicmusicID, false);
				fmod_event_instance_set_parameter(panicmusicID, "state", 0, true);
			}
			if (music != noone)
			{
				fmod_event_instance_stop(music.event, true);
				fmod_event_instance_stop(music.event_secret, true);
			
				if (room == tower_finalhallway && !MOD.DeathMode)
				{
					exitmusic = true;
					fmod_event_instance_stop(panicmusicID);
					fmod_event_instance_play(music.event);
				}
			}
			if instance_exists(obj_hungrypillar)
			{
				fmod_event_instance_stop(pillarmusicID, true);
				fmod_set_parameter("pillarfade", 0, true);
				fmod_event_instance_set_parameter(panicmusicID, "state", 0, true);
			}
		}
		else if global.leveltosave == "exit" && is_struct(music)
		{
			if MOD.Lap3 && global.laps >= 2
				fmod_event_instance_set_parameter(music.event, "state", 20, true);
			else if global.lap
				fmod_event_instance_set_parameter(music.event, "state", 2, true);
		}	
		else if fmod_event_instance_is_playing(panicmusicID)
		{
			if !global.lap
			{
				if global.fill <= 672 // time running out
					fmod_event_instance_set_parameter(panicmusicID, "state", 1, true);
			}
			else
			{
				if MOD.Lap3 && global.laps >= 2 // pillar john's revenge
					fmod_event_instance_set_parameter(panicmusicID, "state", 20, true);
				else if global.laps >= 4 // blue licorice
					fmod_event_instance_set_parameter(panicmusicID, "state", 3, true);
				else // the death that I deservioli
					fmod_event_instance_set_parameter(panicmusicID, "state", 2, true);
			}
		}
	}
	else
	{
		panicstart = false;
		fmod_event_instance_stop(panicmusicID, true);
	
		if instance_exists(obj_player)
		{
			if instance_exists(obj_levelLoader)
				cyop_music();
			else
				cyop_freemusic();
		}
	}
}

var _found = false;
with (obj_totem)
{
	if (fmod_event_instance_is_playing(snd) && distance_to_object(obj_player1) <= 400)
		_found = true;
}
with (obj_player)
{
	if (state == states.gottreasure)
		_found = true;
}
if (_found)
	fmod_set_parameter("totem", 1, false);
else
{
	fmod_set_parameter("totem", 0, false);
	if (instance_exists(obj_bossdark))
		fmod_set_parameter("totem", 1, false);
	if (instance_exists(obj_charswitch_intro))
		fmod_set_parameter("totem", 2, false);
}
if (exitmusic && fmod_event_instance_is_playing(panicmusicID))
	fmod_event_instance_stop(panicmusicID, true);
