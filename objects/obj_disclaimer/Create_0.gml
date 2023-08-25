state = 0;
are_you_sure = false;
fade_alpha = 1;

// menus
scr_initinput();
image_speed = 0.35;
menu = 0;
sel = 0;

options = noone;
saves = array_create(3, noone);
selected = [0, 0, 0, 0];
pizzashift = [0, 0];

// box
size = 0;
surf = noone;
t = 0;

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");

// check availability
req = -1;
str = "This is an anti-leaking measure.\n\nPlease connect to the internet to continue.\nYou may have the game blocked on your firewall.";

/*
if DEBUG
{
	net = true;
	state = 2;
	are_you_sure = true;
}
else*/
{
	net = os_is_network_connected(false);
	if net // radix please provide us with a better way...
	{
		//req = http_get("http://pto-level-editor.000webhostapp.com/disclaimer");
		req = http_get(base64_decode("aHR0cDovL3B0by1sZXZlbC1lZGl0b3IuMDAwd2ViaG9zdGFwcC5jb20vZGlzY2xhaW1lcg=="));
	}
	else
	{
		t = -.5;
		state = 1;
		sound_play("event:/modded/sfx/diagopen");
	}
}
