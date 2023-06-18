if (ds_list_find_index(global.baddieroom, id) == -1)
{
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = other.deadspr;
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	instance_create(x, y, obj_bangeffect);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
}
