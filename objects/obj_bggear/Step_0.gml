//exit;

if (!global.panic)
	image_angle += (abs(sin(scr_current_time() / 625) * rotspd) * sign(image_xscale));
else
	image_angle += (rotspd * 2 * sign(image_xscale));
