var gate = id;
with (other)
{
	if (place_meeting(x, y, other) && key_up && grounded && (state == states.ratmount || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && spotlight == 1)
	{
		stop_music();
		if REMIX
		{
			smoothx = x - other.x;
			x = other.x;
		}
		global.startgate = true;
		global.collect = 0;
		global.leveltosave = other.level;
		global.leveltorestart = other.targetRoom;
		global.levelattempts = 0;
		global.hub_bgsprite = other.bgsprite;
		backtohubstartx = x;
		backtohubstarty = y;
		backtohubroom = instance_exists(obj_levelLoader) ? obj_levelLoader.room_name : room;
		mach2 = 0;
		obj_camera.chargecamera = 0;
		image_index = 0;
		state = states.victory;
		create_transformation_tip("{u}[T] Modifiers/", "modifiers", true);
		exit;
	}
}

if other.key_taunt2 && other.state == states.victory && allow_modifier
{
	other.state = states.actor;
	instance_create_depth(0, 0, 0, obj_levelsettings, {level: level, levelname: msg})
}
else if (floor(other.image_index) == other.image_number - 1 or other.key_taunt2) && other.state == states.victory
{
	with other
	{
		obj_music.fadeoff = 0;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		if (targetRoom == tower_finalhallway or targetRoom == exit_1)
			global.exitrank = true;
		
		obj_tv.tv_bg.sprite = gate.bgsprite;
		obj_tv.tv_bg.parallax = gate.bgparallax;
		
		if gate.levelName != ""
		{
			var targetLevel = concat(global.custom_path, "/levels/", gate.levelName, "/level.ini");
			if !file_exists(targetLevel)
				show_message($"{gate.levelName} level doesn't exist");
			else
				cyop_load_level(targetLevel);
		}
		else if gate.level != "tutorial" && gate.show_titlecard
		{
			if (gate.object_index != obj_bossdoor)
			{
				if gate.info != noone
				{
					// sugary
					with instance_create_unique(x, y, obj_titlecard_ss)
					{
						group_arr = gate.group_arr;
						info = gate.info;
					}
				}
				else
				{
					// pizza tower
					with instance_create_unique(x, y, obj_titlecard)
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

// level name at the bottom of the screen
if REMIX && other.state != states.victory && other.state != states.backtohub && (highscore > 0 or global.sandbox or (boss && hats > 0))
&& !place_meeting(x, y, obj_tutorialbook)
{
	if !instance_exists(transfotip)
	{
		if instance_exists(obj_transfotip)
			transfotip = obj_transfotip.id;
		else
			transfotip = instance_create(x, y, obj_transfotip, {destroy: true});
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
