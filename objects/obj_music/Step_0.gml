prevpillar_on_camera = pillar_on_camera;
if (fmod_event_instance_is_playing(kidspartychaseID) && instance_exists(obj_pause) && !obj_pause.pause && !instance_exists(obj_monster))
{
	trace("Stopping kidsparty music");
	fmod_event_instance_stop(kidspartychaseID, false);
	instance_destroy(obj_kidspartybg);
	if (music != -4)
	{
		fmod_event_instance_set_paused(music.event, savedmusicpause);
		fmod_event_instance_set_paused(music.event_secret, savedsecretpause);
	}
	fmod_event_instance_set_paused(pillarmusicID, savedpillarpause);
	fmod_event_instance_set_paused(panicmusicID, savedpanicpause);
}
if (instance_exists(obj_hungrypillar))
{
	fmod_event_instance_set_paused(pillarmusicID, false);
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
if (prevpillar_on_camera != pillar_on_camera)
{
	if (pillar_on_camera)
		fmod_set_parameter("pillarfade", 1, false);
	else
		fmod_set_parameter("pillarfade", 0, false);
}
if ((global.panic or (global.snickchallenge && room != tower_sage)) && global.leveltosave != "dragonlair" && global.leveltosave != "grinch" && global.leveltosave != "sucrose")
{
	if (!panicstart && instance_exists(obj_player1))
	{
		fmod_event_instance_release(panicmusicID);
		
		if global.snickchallenge
			panicmusicID = fmod_event_create_instance("event:/modded/level/snickchallenge");
		else
		{
			var char = obj_player1.character;
			switch char
			{
				default: panicmusicID = fmod_event_create_instance("event:/music/pizzatime"); break;
				case "N": panicmusicID = fmod_event_create_instance("event:/music/pizzatimeN"); break;
				case "V": panicmusicID = fmod_event_create_instance("event:/music/pizzatimeV"); break;
				case "S": panicmusicID = fmod_event_create_instance("event:/music/pizzatimeS"); break;
				case "SP": panicmusicID = fmod_event_create_instance("event:/music/pizzatimeSP"); break;
				case "BN": panicmusicID = fmod_event_create_instance("event:/music/pizzatimeBN"); break;
				case "PN": panicmusicID = fmod_event_create_instance("event:/music/pizzatimePN"); break;
				case "SN": panicmusicID = fmod_event_create_instance("event:/music/pizzatimeSN"); break;
			}
		}
		
		trace("Starting panic music: step");
		panicstart = true;
		if (room != tower_finalhallway)
		{
			fmod_event_instance_play(panicmusicID);
			fmod_event_instance_set_paused(panicmusicID, false);
			fmod_event_instance_set_parameter(panicmusicID, "state", 0, true);
		}
		if (music != -4)
		{
			fmod_event_instance_stop(music.event, true);
			fmod_event_instance_stop(music.event_secret, true);
		}
		if (room == tower_finalhallway)
		{
			exitmusic = true;
			fmod_event_instance_stop(panicmusicID);
			fmod_event_instance_play(music.event);
		}
		fmod_event_instance_stop(pillarmusicID, true);
		fmod_set_parameter("pillarfade", 0, true);
		fmod_event_instance_set_parameter(panicmusicID, "state", 0, true);
	}
	else if (fmod_event_instance_is_playing(panicmusicID))
	{
		if (!global.lap)
		{
			if (global.fill <= 672) // time running out
				fmod_event_instance_set_parameter(panicmusicID, "state", 1, true);
		}
		else
		{
			if global.laps > 1 && instance_exists(obj_pizzaface) // pillar john's revenge
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
