var gate = id;
with (other)
{
	if (place_meeting(x, y, other) && key_up && grounded && (state == states.ratmount || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && spotlight == 1)
	{
		audio_stop_all();
		stop_music();
		if REMIX
		{
			smoothx = x - other.x;
			x = other.x;
		}
		global.startgate = true;
		global.leveltosave = other.level;
		global.leveltorestart = other.targetRoom;
		global.levelattempts = 0;
		global.hub_bgsprite = other.bgsprite;
		backtohubstartx = x;
		backtohubstarty = y;
		backtohubroom = room;
		mach2 = 0;
		obj_camera.chargecamera = 0;
		image_index = 0;
		state = states.victory;
		obj_player2.backtohubstartx = x;
		obj_player2.backtohubstarty = y;
		obj_player2.backtohubroom = room;
		exit;
	}
}
if floor(other.image_index) == other.image_number - 1 && other.state == states.victory
{
	with other
	{
		obj_music.fadeoff = 0;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		if (targetRoom == exit_1)
			global.exitrank = true;
		if (targetRoom == tower_finalhallway)
			global.exitrank = true;
		if (gate.level != "tutorial")
		{
			if (gate.object_index != obj_bossdoor)
			{
				if !instance_exists(obj_titlecard) && !instance_exists(obj_titlecard_ss)
				{
					if gate.info != -4
					{
						// sugary
						with instance_create(x, y, obj_titlecard_ss)
						{
							group_arr = gate.group_arr;
							info = gate.info;
						}
					}
					else
					{
						// pizza tower
						with instance_create(x, y, obj_titlecard)
						{
							group_arr = gate.group_arr;
							titlecard_sprite = gate.titlecard_sprite;
							titlecard_index = gate.titlecard_index;
							title_sprite = gate.title_sprite;
							title_index = gate.title_index;
							title_music = gate.title_music;
						}
					}
				}
			}
			else
			{
				with (instance_create_unique(0, 0, obj_fadeout))
				{
					restarttimer = true;
					group_arr = gate.group_arr;
				}
			}
		}
		else
		{
			with (instance_create_unique(0, 0, obj_fadeout))
				restarttimer = true;
		}
	}
}
else if other.key_taunt2 && other.state == states.victory
{
	other.state = states.actor;
	with instance_create(0, 0, obj_levelsettings)
	{
		level = other.level;
		levelname = other.msg;
	}
}

// level name at the bottom of the screen
if REMIX && other.state != states.victory && other.state != states.backtohub && (highscore > 0 or global.sandbox)
{
	if !instance_exists(transfotip)
	{
		if instance_exists(obj_transfotip)
			transfotip = obj_transfotip.id;
		else
			transfotip = instance_create(x, y, obj_transfotip);
	}
	else with transfotip
	{
		other.transfotip = id;
		
		var t = "{s}" + other.msg + "/";
		if text != t
		{
			text = t;
			alarm[0] = 1;
		}
		alarm[1] = 5;
		
		fadeout_speed = 0.025;
		fadeout = false;
	}
}
