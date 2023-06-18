trigger = 1;
func = function(argument0)
{
	if (!active)
	{
		if (argument0.state == states.freefallland)
			active = true;
	}
};
