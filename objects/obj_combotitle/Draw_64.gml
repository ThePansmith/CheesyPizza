if !global.option_hud
	exit;
/* Loy you broke this code but i think your implementation draws it the exact same anyway
if !REMIX
{
	for (var i = 0; i < array_length(afterimages); i++)
	{
		var b = afterimages[i];
		trace($"combo after image {i}: {b[3]}");
		draw_sprite_ext(b[2], b[3], b[0], b[1], image_xscale, image_yscale, image_angle, image_blend, b[4]);
		afterimages[i][4] -= 0.15;
	}
}*/
scr_combotitledraw(sprite_index, x, y, title, title_index);
