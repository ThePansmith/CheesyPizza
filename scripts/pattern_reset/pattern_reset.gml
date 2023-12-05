function pattern_reset()
{
	var g = shader_current();
	shader_set(shd_pal_swapper);
    pattern_enable(false);
	shader_set(g);
}
