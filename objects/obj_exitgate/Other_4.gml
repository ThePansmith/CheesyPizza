if (ds_list_find_index(global.saveroom, id) != -1 && global.panic == false)
{
	if sprite_index == spr_sugarygateopen
		sprite_index = spr_sugarygateclosed;
	else
		image_index = 0;
}
if (ds_list_find_index(global.baddieroom, id) != -1 && drop)
{
	y = drop_y;
	dropstate = states.idle;
	hand_y = -100;
}
