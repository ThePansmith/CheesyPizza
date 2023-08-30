if invtime <= 0 && state != states.grabbed
{
	with (other)
	{
		if state == states.mach3
		{
			create_slapstar(other.x, other.y);
            create_baddiegibs(other.x, other.y);
			instance_create(other.x, other.y, obj_bangeffect);
			instance_create(other.x, other.y, obj_parryeffect);
			machpunchAnim = true;
			other.state = states.thrown
			other.vsp = -11
			other.movespeed = movespeed + 2
			other.xscale = xscale
			other.flash = true;
			other.invtime = 10;
			sound_play_3d(sfx_punch, x, y);
		}
	}
}
