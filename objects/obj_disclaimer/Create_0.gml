state = 0;
are_you_sure = false;
fade_alpha = 1;

// box
size = 0;
surf = noone;
t = 0;

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");

// check availability
req = -1;
str = "Please connect to the internet.";

if DEBUG
{
	net = true;
	state = 2;
	are_you_sure = true;
}
else
{
	net = os_is_network_connected(false);
	if net // radix please provide us with a better way...
		req = http_get("http://pto-level-editor.000webhostapp.com/disclaimer");
	else
	{
		t = -.5;
		state = 1;
		sound_play("event:/modded/sfx/diagopen");
	}
}
