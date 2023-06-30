if state == states.hurt or (state == states.backbreaker && character == "PP")
{
	state = states.normal;
	movespeed = 0;
	
	if scr_solid(x, y)
	{
		var ty = try_solid(0, 1, obj_solid, 32);
		if ty != -1
			y += ty;
	}
}
else if state == states.ratmounthurt
{
	state = states.ratmount;
	movespeed = 0;
}
