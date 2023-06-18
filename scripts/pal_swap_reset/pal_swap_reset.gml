function pal_swap_reset()
{
	shader_set_uniform_f(global.Pal_Index, 0);
	shader_reset();
}
