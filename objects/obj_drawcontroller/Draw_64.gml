draw_set_alpha(flash);
draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);

if MOD.Spotlight && room != timesuproom
{
	shader_reset();
	gpu_set_blendmode(bm_normal);
	
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 960, 540, false);
	gpu_set_blendmode(bm_subtract);
	
	var draw_spotlight = function(who = obj_player, size = 100, xo = 0, yo = 0, iter = 2)
	{
		var camx = camera_get_view_x(view_camera[0]);
		var camy = camera_get_view_y(view_camera[0]);
		
		with who
		{
			/*
			var size_real = size;
			for(var i = 0; i < iter; i++)
			{
				if i > 0
					size_real += 20 / (i / 3);
				
				draw_set_alpha(1 / (i + 1));
				draw_circle(x + xo - camx + random_range(-1, 1), y + yo - camy + random_range(-1, 1), size_real, false);
			}
			*/
			
			var xx = x + xo - camx;
			if MOD.Mirror
				xx = SCREEN_WIDTH - xx;
			
			draw_set_alpha(1);
			draw_circle(xx + random_range(-1, 1), y + yo - camy + random_range(-1, 1), size, false);
			draw_set_alpha(0.35);
			draw_circle(xx + random_range(-1, 1), y + yo - camy + random_range(-1, 1), size + 30, false);
		}
	}
	if instance_exists(obj_endlevelfade) or room == rank_room
		spotlight_size = Approach(spotlight_size, 960, 10);
	else
		spotlight_size = lerp(spotlight_size, lerp(50, 150, global.combotime / 60), 0.2);
	
	if !(instance_exists(obj_technicaldifficulty) && obj_player1.state == states.actor)
		draw_spotlight(obj_player1, spotlight_size, obj_player1.smoothx);
	
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	
	draw_set_colour(c_white);
	
	reset_shader_fix();
	reset_blendmode();
}
