toggle_collisions(global.showcollisions or safe_get(obj_shell, "WC_showcollisions"));
if !safe_get(obj_pause, "pause")
	global.time++;
