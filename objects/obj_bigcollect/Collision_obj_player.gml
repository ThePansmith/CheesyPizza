if (other.state != states.gotoplayer)
{
	fail_modifier(MOD.NoToppings);
	if (obj_player1.character == "V")
		global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
	global.heattime = 60;
	with (obj_camera)
		healthshaketime = 60;
	if global.snd_collectpizza == global.snd_collect
		scr_sound_multiple(global.snd_collectpizza, x, y);
	else
		sound_play_oneshot(global.snd_collectpizza);
	instance_destroy();
	global.combotime = 60;
	
	if !global.snickchallenge
	{
		var val = heat_calculate(value);
		if (other.object_index == obj_player1)
			global.collect += val;
		else
			global.collectN += val;
		if (visible)
			create_collect(x, y, sprite_index, val);
		with (instance_create(x + 16, y, obj_smallnumber))
			number = string(val);
		tv_do_expression(spr_tv_exprcollect);
	}
}
