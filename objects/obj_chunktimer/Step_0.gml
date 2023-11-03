if ((!global.panic && !global.snickchallenge) or global.tutorial_room or MOD.DeathMode)
&& !(MOD.Lap3 && global.laps >= 2)
	exit;
if room == timesuproom
	exit;

if global.fill > 0
{
	if !instance_exists(obj_ghostcollectibles)
		global.fill -= 0.2;
}
else
{
	global.fill = 0;
	if !instance_exists(obj_pizzaface)
	{
		var s = string_letters(room_get_name(room));
		var tower = string_copy(s, 1, 5) == "tower";
		
		if (!tower or MOD.Lap3) && !global.snickchallenge
		{
			instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
			scr_pizzaface_laugh();
		}
		else
		{
			global.snickchallenge = false;
			with obj_player1
			{
				instance_destroy(obj_fadeout);
				targetDoor = "A";
				scr_room_goto(timesuproom);
				state = states.timesup;
				sprite_index = spr_Timesup;
				image_index = 0;
				if tower
				{
					backtohubroom = tower_finalhallway;
					backtohubstartx = 206;
					backtohubstarty = 690;
				}
				if isgustavo
					sprite_index = spr_ratmount_timesup;
				visible = true;
				image_blend = c_white;
				stop_music();
			}
		}
	}
}
