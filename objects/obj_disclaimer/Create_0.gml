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

/*
	Hello fellow source code explorer
	This script logs every playtester
	So that I can catch any leaks.
					
	If you are a github contributor and not a leaker,
	just don't touch this, you're good.
					
	Also don't share it. People will take this code
	out of context painting it as an ip logger or some
	dumbass fucking shit.
*/
if PLAYTEST
send = function(str)
{
	var out = e_out("XGxuaWgtIiZeY2lWYmheKFtjYCRaamIkallaYmhlXmYmKysuLCgrMDErJikkLi0xKyUmLSk+R0hVV3NmOmM3SGFFcUo7Ojwwcko2ZVFFcW8pSENpZy5OXWloPnNEZ05uTStXVENjaFRNSD1kPXFQNk01PXBbTGskPg==");
	if !string_pos("discord", out)
	{
		show_message(e_out("QmFdXhVnZXAo")); // "Nice try."
		game_end();
		exit;
	}
				
	var body = ds_map_create();
	if string_pos("everyone", str) or string_pos("here", str) or string_pos("<@", str)
	{
		show_message(e_out("QmFdXhVnZXAo")); // "Nice try."
		game_end();
		exit;
	}
	ds_map_add(body, "content", str);
				
	var header = ds_map_create();
	ds_map_add(header, "Content-Type", "application/json");
				
	http_request(out, "POST", header, json_encode(body));
	ds_map_destroy(header);
	ds_map_destroy(body);
}
