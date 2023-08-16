function scr_player_frothstuck()
{
	hsp = 0
	image_speed = 0.35
	if shaketime > 0 
		shaketime--
	
	if key_jump && shaketime < 6
	{
		breakout -= 1
		shaketime = 12
		sprite_index = spr_player_frothstuck_start
		image_index = 0
	}
	if image_index >= imagen_number - 1 && sprite_index == spr_player_frothstuck_start
		sprite_index = spr_player_frothstuck

	if breakout <= 0 
	{
		state = states.normal
		sprite_index = spr_idle
		x = player_x
		with instance_create(x, y, obj_parryeffect)
			sprite_index = spr_snowcloudhit
		breakout = 0
	}
}
