if ((other.instakillmove == 1 || other.state == states.handstandjump || other.state == states.mach2) && !death)
{
	death = true;
	var t = other.id;
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	add_baddieroom();
	global.combotime = 60;
	global.combo++;
	instance_create(x, y, obj_bangeffect);
	create_particle(x, y, part.genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_clerkdead;
		hsp = t.xscale * 10;
	}
	instance_destroy();
}
