if (async_load[?"event_type"] != FMOD_BEAT_CALLBACK)
	exit;
	
if !global.panic
	image_angle += (rotspd * 2 * sign(image_xscale));
else
	exit;
	

image_angle = (image_angle + degree_per_beat) % 360;
//trace($"GAMEMAKER: bar: {async_load[?"bar"]} beat: {async_load[?"beat"]} position: {async_load[?"position"]} tempo: {async_load[?"tempo"]} time signature: {async_load[?"timesignatureupper"]}/{async_load[?"timesignaturelower"]}");


