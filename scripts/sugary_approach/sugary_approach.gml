function approach(val, a, b)
{
	return val + clamp(a - val, -b, b);
}

function slopeCheck(argument0, argument1)
{
	return scr_slope(argument0, argument1 + 1) && !scr_solid_slope(argument0, argument1 + 1) && !scr_solid_slope(argument0, argument1) && scr_slope(argument0, (argument1 - bbox_top) + bbox_bottom);
}