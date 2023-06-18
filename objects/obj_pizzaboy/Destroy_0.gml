if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
	notification_push(notifs.pizzaboy_dead, [room]);
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
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
		sprite_index = other.spr_dead;
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
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
		sprite_index = other.spr_dead;
}
