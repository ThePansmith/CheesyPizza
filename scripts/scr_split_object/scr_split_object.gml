function scr_split_object()
{
	if (image_xscale > 1 || image_yscale > 1)
	{
		var imagex = image_xscale;
		var imagey = image_yscale;
		image_xscale = 1;
		image_yscale = 1;
		
		for (var xx = 0; xx < imagex; xx++)
		{
			for (var yy = 0; yy < imagey; yy++)
			{
				instance_create(x + sprite_width * xx, y + sprite_height * yy, object_index);
			}
		}
		return true;
	}
	return false;
}