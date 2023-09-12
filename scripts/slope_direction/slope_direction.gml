function slope_direction() 
{
	with check_slope(x, y + 1)
		return sign(image_xscale);
}
