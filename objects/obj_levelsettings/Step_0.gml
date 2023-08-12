if menu == 1
{
	if state == 0
		event_inherited();
	
	if instance_exists(obj_titlecard)
		fadealpha = obj_titlecard.fadealpha;
	if instance_exists(obj_fadeout)
		fadealpha = obj_fadeout.fadealpha;
	
	if safe_get(obj_titlecard, "start")
		instance_destroy();
}
