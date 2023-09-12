// I just stole this from sugary
function slopeMomentum_direction() 
{

	if check_slope(x, y + 1) {
		with (check_slope(x, (y + 1)))
			return (sign(image_xscale));
	}
}