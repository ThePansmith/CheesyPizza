var p = other.id;
with (other)
{
	if (state != states.antigrav && state != states.backbreaker && state != states.chainsaw && other.cooldown == 0)
	{
		create_transformation_tip(lang_get_value("antigravtip"), "antigrav");
		if (state == states.rocket || state == states.rocketslide)
		{
			with (instance_create(x, y + 12, obj_rocketdead))
			{
				hsp = p.xscale * 6;
				vsp = 5;
				image_xscale = sign(hsp);
			}
		}
		state = states.antigrav;
		vsp = 0;
		sound_play_oneshot("event:/sfx/antigrav/start");
		sound_play_oneshot_3d("event:/sfx/misc/bubblestation", x, y);
		with (obj_antigravbubble)
		{
			if (playerid == other.id)
				instance_destroy();
		}
		other.cooldown = 50;
		with (instance_create(x, y, obj_antigravbubble))
			playerid = other.id;
		other.image_index = 0;
		other.sprite_index = spr_antigrav_activate;
	}
}
