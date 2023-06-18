if (lastform == 0)
{
	ds_list_add(global.baddieroom, id);
	instance_destroy(other);
	sprite_index = spr_cheesedragon_hurt;
	image_index = 0;
	alarm[0] = -1;
	repeat (5)
		create_baddiegibs(x, y);
	repeat (5)
		create_slapstar(x, y);
	with (obj_camera)
	{
		shake_mag = 10;
		shake_mag_acc = 30 / room_speed;
	}
	global.combotime = 60;
}
else
{
	with (instance_create(x, y, obj_sausageman_dead))
	{
		sprite_index = spr_cheesedragon_hurt;
		image_index = 4;
	}
	repeat (5)
		create_baddiegibs(x, y);
	repeat (5)
		create_slapstar(x, y);
	with (obj_camera)
	{
		shake_mag = 10;
		shake_mag_acc = 30 / room_speed;
	}
	global.combotime = 60;
	instance_destroy();
}
