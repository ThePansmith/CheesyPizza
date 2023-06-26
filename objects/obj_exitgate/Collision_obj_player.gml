var forgot = false;
if ((image_index == 1 && !sugary) or (sugary && sprite_index != spr_sugarygateclosed) && global.panic == false && room != war_13 && !forgot)
{
	with (other)
	{
		if (state == states.comingoutdoor && floor(image_index) == image_number - 3 && other.sugary)
		{
			if other.sprite_index != spr_sugarygateclosing
			{
				other.image_index = 0;
				other.sprite_index = spr_sugarygateclosing;
			}
		}
		if (state == states.comingoutdoor && floor(image_index) == image_number - 2)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
			GamepadSetVibration(0, 1, 1, 0.9);
			GamepadSetVibration(1, 1, 1, 0.9);
			lastroom = room;
			sprite_index = isgustavo ? spr_ratmount_doorclosed : spr_Timesup;
			image_index = 0;
			with (obj_camera)
			{
				shake_mag = 10;
				shake_mag_acc = 30 / room_speed;
			}
			if other.sugary
			{
				other.sprite_index = spr_sugarygateclosing;
				other.image_index = 1;
				other.image_speed = 0.35;
			}
			else
				other.image_index = 0;
			ds_list_add(global.saveroom, other.id);
		}
	}
}
if (drop && dropstate != states.idle)
	exit;
with (other)
{
	if (grounded && (x > (other.x - 160) && x < (other.x + 160)) && key_up && (state == states.ratmount || state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic == true || global.snickchallenge == 1 || room == war_13))
	{
		global.noisejetpack = false;
		global.startgate = false;
		stop_music();
		if (global.collect <= 0)
            global.collect = 10;
		scr_do_rank();
	}
}
