if !MOD.Lappable
{
	instance_destroy(id, false);
	with instance_create(x, y, obj_solid)
	{
		image_xscale = 2;
		image_yscale = 2;
	}
}
