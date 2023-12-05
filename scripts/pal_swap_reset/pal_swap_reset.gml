function pal_swap_reset()
{
	shader_set(shd_pal_swapper);
	shader_set_uniform_i(global.Pattern_Enable, false);
	shader_set_uniform_f(global.Pal_Index, 0);
	shader_reset();
}
