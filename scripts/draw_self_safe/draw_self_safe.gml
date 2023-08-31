function draw_self_safe()
{
	if sprite_exists(sprite_index)
		draw_self();
}
function draw_sprite_safe(sprite, subimg, x, y)
{
	if sprite_exists(sprite)
		draw_sprite(sprite, subimg, x, y);
}
