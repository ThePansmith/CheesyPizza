/// @description Drawing Sprite
if room == Mainmenu or room == rank_room or room != data.room exit;

var tex = noone;
if data.paletteTexture != "noone"
	tex = asset_get_index(data.paletteTexture);

pattern_set_temp(global.Base_Pattern_Color, sprite_index, image_index, data.dir, 1, tex)
pal_swap_set(asset_get_index(data.paletteSprite), data.palette, false);
try {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)
} catch (e) {
	trace(e)
	draw_sprite_ext(spr_player_hurt, -1, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha)
}
pattern_reset();
