if (instance_exists(baddieID))
{
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	instance_create(x, y, obj_bangeffect);
	instance_destroy(baddieID);
	instance_destroy();
}
