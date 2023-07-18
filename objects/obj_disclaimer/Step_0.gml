fade_alpha -= 0.1;

// restart the disclaimer if you turn on your internet
if net != os_is_network_connected(false)
	room_restart();

// animation
if state == 1
{
	t = Approach(t, 1, 0.06);
	size = animcurve_channel_evaluate(outback, t);
}

// go
if state == 2
{
	if !are_you_sure // impossible
		room_goto(Funnyroom);
	global.anon = array_create(5, true);

	state = -1;
	room_goto(Realtitlescreen);
}
else if are_you_sure // impossible
	room_goto(Funnyroom);

// drm
if !is_array(global.anon)
	room_goto(Funnyroom);
for(var i = 1; i < 5; i++)
{
	if global.anon[i - 1] != global.anon[i]
	or (global.anon[i] != false && state != -1)
		room_goto(Funnyroom);
}
