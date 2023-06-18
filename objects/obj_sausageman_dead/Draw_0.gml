if (!gui && sprite_index != spr_player_deathend && sprite_index != spr_playerN_deathend && !usepalette)
{
	var d = image_blend;
	if REMIX
		d = get_dark(image_blend, obj_drawcontroller.use_dark);
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, d, image_alpha);
}
