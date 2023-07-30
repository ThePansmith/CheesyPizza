if invtime <= 0 && state != states.grabbed
{
	with (other)
	{
		if state == states.mach3
		{
			create_slapstar(other.baddieID.x, other.baddieID.y);
            create_baddiegibs(other.baddieID.x, other.baddieID.y);
			instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect);
			instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
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
