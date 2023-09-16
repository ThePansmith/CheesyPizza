for (var i = 0; i < array_length(objectlist); i++)
{
	var b = objectlist[i];
	with b
	{
		if place_meeting(x, y + 1, other)
			hsp_carry = other.dir * other.movespeed;
	}
}
