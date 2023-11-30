live_auto_call;

state = 0;
are_you_sure = false;
fade_alpha = 1;

// menus
if !variable_global_exists("input_list")
	scr_initinput();

count = 0;
pto_textbox_init();

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
if PLAYTEST
{
	net = os_is_network_connected(true);
	if net
		req = http_get(e_out("XGxuaWgtIiZqbmUgX1twX2QhWFlibmhnISQoKnBbVVtmbW5YY2MjXGllI1dda11lVlxhXGw="));
	else
	{
		t = -.5;
		state = 1;
	}
}
else
{
	net = true;
	state = 2;
	are_you_sure = true;
}
