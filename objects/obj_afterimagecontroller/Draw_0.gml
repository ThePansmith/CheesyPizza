live_auto_call;
for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with (b)
	{
		if (visible)
		{
			b = image_blend;
			var a = other.alpha[identifier];
			var shd = false;
			
			gpu_set_blendmode(bm_normal);
			shader_reset();
			
			if (identifier == afterimage.firemouth)
			{
				a = alpha;
				shd = true;
				draw_set_flash(make_color_rgb(255 * 0.97, 255 * 0.43, 255 * 0.09));
			}
			else if (identifier == afterimage.blue)
			{
				a = alpha;
				shd = true;
				draw_set_flash(global.blueimg_color);
			}
			else if (identifier == afterimage.enemy or (identifier == afterimage.heatattack && REMIX))
			{
				a = alpha;
				shd = true;
				draw_set_flash(make_color_rgb(233, 47, 0));
			}
			else if (identifier == afterimage.fakepep)
			{
				a = alpha;
				shd = true;
				draw_set_flash(c_red);
			}
			else if (identifier == afterimage.blur)
			{
				a = alpha;
				b = get_dark(other.image_blend, obj_drawcontroller.use_dark, true, x, y);
				if (instance_exists(playerid) && playerid.usepalette)
				{
					shd = true;
					shader_set(shd_pal_swapper);
					if (playerid.object_index == obj_player1)
						pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
					pal_swap_set(playerid.spr_palette, playerid.paletteselect, false);
				}
			}
			else if ((identifier == afterimage.mach3effect or identifier == afterimage.simple)/* && REMIX*/)
			{
				var trans = check_char("SP");
				if REMIX or trans
				{
					shader_set(shd_mach3effect);
					shd = true;
				
					shader_set_uniform_f(other.color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
					b = make_color_hsv(color_get_hue(b), color_get_saturation(b) * 1.25, trans ? 75 : 35);
					shader_set_uniform_f(other.color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
					b = c_white;
				}
				else
				{
					if b == global.mach_color1
						b = other.mach_color1;
					if b == global.mach_color2
						b = other.mach_color2;
				}
			}
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a);
			if (shd)
			{
				pattern_reset();
				shader_reset();
				draw_reset_flash();
			}
		}
	}
}
