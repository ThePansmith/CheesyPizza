if menu == 1
{
	if state == 0
		event_inherited();
	
	if instance_exists(obj_titlecard)
		fadealpha = obj_titlecard.fadealpha;
	if instance_exists(obj_titlecard_ss)
		fadealpha = obj_titlecard_ss.fadealpha;
	if instance_exists(obj_fadeout)
		fadealpha = obj_fadeout.fadealpha;
	
	if safe_get(obj_titlecard, "start") or safe_get(obj_titlecard_ss, "shown")
		instance_destroy();
}
