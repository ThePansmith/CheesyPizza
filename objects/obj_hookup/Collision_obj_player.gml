with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.fireass || state == states.punch || state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = states.ladder;
		x = other.x + 16;
		y = other.y + 40;
	}
	if (key_up && ladderbuffer == 0 && (state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmount))
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		state = states.ratmountladder;
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				create_particle(x, y, particle.genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = other.y + 40;
	}
}
