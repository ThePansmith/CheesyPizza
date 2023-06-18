with (other)
{
	if (key_up && ladderbuffer == 0 && (state == states.normal or state == states.pogo or state == states.mach2 or state == states.mach3 or state == states.mach1 or state == states.punch or state == states.shotgunjump or state == states.jump or state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		if REMIX
			smoothx = x - (other.x + 16);
		
		input_buffer_jump = 0;
		state = states.ladder;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
	if (key_up && ladderbuffer == 0 && (state == states.ratmountjump or state == states.ratmountbounce or state == states.ratmount))
	{
		if REMIX
			smoothx = x - (other.x + 16);
		
		input_buffer_jump = 0;
		state = states.ratmountladder;
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				instance_create(x, y, obj_genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
