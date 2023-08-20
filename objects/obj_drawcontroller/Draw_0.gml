// border outside the room
if safe_get(obj_shell, "WC_oobcam") != true
{
	var camx = camera_get_view_x(view_camera[0]), camy = camera_get_view_y(view_camera[0]);
	
	draw_set_color(c_black);
	//if camx < 0
		draw_rectangle(0, min(camy, -50), min(camx, -50), max(camy + 540, room_height + 50), false);
	//if camx > room_width - 960
		draw_rectangle(room_width, min(camy, -50), max(camx + 960, room_width + 50), max(camy + 540, room_height + 50), false);
	//if camy < 0
		draw_rectangle(0, 0, room_width, min(camy, -50), false);
	//if camy > room_height - 540
		draw_rectangle(0, room_height, room_width, max(camy + 540, room_height + 50), false);
}

draw_set_color(c_white);
if (use_dark)
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with (objdark_arr[i])
		{
			if (visible)
			{
				var b = get_dark(image_blend, other.use_dark);
				if SUGARY
				{
					draw_set_flash(b);
					draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha);
					draw_reset_flash();
				}
				else
				{
					var ix = image_xscale;
					if (object_index == obj_vigilantecow)
						ix = xscale;
					if variable_instance_exists(id, "spr_palette") && sprite_exists(spr_palette)
					{
						shader_set(shd_pal_swapper);
						pal_swap_set(spr_palette, paletteselect, false);
					}
					draw_sprite_ext(sprite_index, image_index, x, y, ix, image_yscale, image_angle, b, image_alpha);
					pal_swap_reset();
				}
			}
		}
	}
}
if (obj_player1.finisher || obj_player2.finisher || (obj_player.state == states.playersuperattack && obj_player.superattackstate == states.transition))
	finisher_alpha = Approach(finisher_alpha, 0.3, 0.1);
else if (finisher_alpha > 0)
	finisher_alpha = Approach(finisher_alpha, 0, 0.02);
if (finisher_alpha > 0)
{
	draw_set_alpha(finisher_alpha);
	draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, 0, 0, 0, 0, false);
	draw_set_alpha(1);
}
var _kungfu = global.kungfu;
with (obj_baddie)
{
	if (object_index != obj_pizzafaceboss)
		draw_enemy(_kungfu, true);
}

shader_set(shd_pal_swapper);
with (obj_heatafterimage)
{
	if (visible)
	{
		pattern_set(global.Base_Pattern_Color, obj_player1.sprite_index, obj_player1.image_index, obj_player1.xscale, obj_player1.yscale, global.palettetexture);
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
		draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, obj_player1.angle, c_white, alpha);
	}
}
if (room == boss_fakepep)
{
    with (obj_fakepepclone)
    {
        if (visible && !flash)
        {
            pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
            pal_swap_set(spr_peppalette, gustavo_palette(obj_player1.paletteselect), 0);
            draw_self();
            pal_swap_set(spr_peppalette, 13, 0);
            draw_self();
        }
    }
}
pal_swap_reset();

draw_set_flash();
with (obj_baddie)
{
	var _stun = 0;
	if (state == states.stun && object_index != obj_pizzaball)
		_stun = 25;
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale, angle, image_blend, image_alpha);
}
if (room == boss_fakepep)
{
    with (obj_fakepepclone)
    {
        if (visible && flash)
            draw_self();
    }
}
with (obj_deadjohnparent)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x + hurtx, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
with (obj_smallnumber)
{
	if (visible && flash)
	{
		draw_set_font(global.smallnumber_fnt);
		draw_set_halign(fa_center);
		draw_text(x, y, number);
	}
}
for (i = 0; i < array_length(flash_arr); i++)
{
	with (flash_arr[i])
	{
		if (visible && flash)
			event_perform(8, 0);
	}
}
draw_reset_flash();

shader_set(shd_pal_swapper);
pal_swap_set(spr_peppalette, 0, false);
with (obj_pizzagoblinbomb)
{
	if (grabbable && grounded && vsp > 0)
		draw_sprite(spr_grabicon, -1, x - 10, y - 30);
	draw_self();
}

with (obj_player1)
{
	if (visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
}
with obj_sausageman_dead
{
	if !gui && visible && bbox_in_camera(view_camera[0], 32)
	{
		var b = get_dark(image_blend, other.use_dark);
		if other.use_dark && SUGARY
		{
			draw_set_flash(b);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
			draw_reset_flash();
		}
		else
		{
			if sprite_exists(spr_palette)
			{
				if oldpalettetexture != noone
					pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, oldpalettetexture);
				pal_swap_set(spr_palette, paletteselect, false);
			}
			else
				pal_swap_reset();
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
			if oldpalettetexture != noone
	            pattern_reset();
		}
	}
}
pal_swap_reset();

draw_set_flash();
with (obj_player1)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(player_sprite(), image_index, x + smoothx, y, xscale, yscale, image_angle, image_blend, image_alpha);
}
draw_reset_flash();

// pto entrance lamp overlays
with obj_lampost
{
	if sprite_index == spr_lampostpanic_NEW
		draw_sprite_ext(sprite_index, image_index + 2, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

// midway boxofpizza
with obj_boxofpizza
{
	if bo
		draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
