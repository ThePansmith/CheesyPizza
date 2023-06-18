if (destroy)
{
	ds_list_add(global.saveroom, id);
	with (instance_create(x, y, obj_explosioneffect))
		sprite_index = spr_bombexplosion;
	instance_create(x, y, obj_bangeffect);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_hungrypillar_dead;
}
