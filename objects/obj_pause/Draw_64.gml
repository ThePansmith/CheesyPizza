live_auto_call;
if instance_exists(obj_keyconfig)
	exit;

toggle_alphafix(true);
if check_sugary()
	scr_pausedraw_ss();
else
	scr_pausedraw();
toggle_alphafix(false);
