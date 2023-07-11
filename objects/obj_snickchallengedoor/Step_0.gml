if locked
{
	sprite_index = spr_doorblocked;
	if uparrowID != -4
	{
		instance_destroy(uparrowID);
		uparrowID = -4;
	}
}
