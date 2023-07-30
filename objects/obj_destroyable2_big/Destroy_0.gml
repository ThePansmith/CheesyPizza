if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
{
	fail_modifier(MOD.NoToppings);
	
	scr_sleep(5);
	with (instance_create(x + 32, y + 32, obj_parryeffect))
		sprite_index = other.spr_dead;
	
	if (sprite_exists(particlespr))
	{
		repeat (6)
			create_debris(x + sprite_width / 2, y + sprite_height / 2, particlespr);
	}
	
	if (content == obj_null)
	{
		global.heattime += 10;
		global.heattime = clamp(global.heattime, 0, 60);
		global.combotime += 50;
		global.combotime = clamp(global.combotime, 0, 60);
		
		if !global.snickchallenge
		{
			var val = heat_calculate(100);
			global.collect += val;
			scr_sound_multiple(global.snd_collect, x, y);
			with (instance_create(x + 16, y, obj_smallnumber))
				number = string(val);
		}
	}
	else
		instance_create(x + 32, y, content);
	repeat (3)
		create_baddiegibsticks(x + 32, y + 32);
	notification_push(notifs.block_break, [room]);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
