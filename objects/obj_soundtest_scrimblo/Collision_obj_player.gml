if ((other.instakillmove == 1 || other.state == states.handstandjump || other.state == states.mach2) && !death)
{
	death = true;
	var t = other.id;
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	sound_play_3d("event:/modded/sfx/voice/scrimbdeath", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	add_baddieroom();
	instance_create(x, y, obj_bangeffect);
	create_particle(x, y, part.genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_scrimbsoundtest_dead;
		hsp = t.xscale * 10;
	}
	instance_destroy();
}
