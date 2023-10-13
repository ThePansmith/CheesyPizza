if (!gui && sprite_index != spr_player_deathend && sprite_index != spr_playerN_deathend && !usepalette)
&& !REMIX
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
