/// @func draw_save_state
/// @desc	Saves the current state of drawing
/// @return  {struct.DrawState}
function draw_save_state()
{
	return {
		blendmode : gpu_get_blendmode(),
		shader : shader_current(),
		color : draw_get_color(),
		alpha : draw_get_alpha(),
		font : draw_get_font(),
		valign : draw_get_valign(),
		halign : draw_get_halign(),
		
		zwrite : gpu_get_zwriteenable(),
		ztest : gpu_get_ztestenable(),
		alphatest : gpu_get_alphatestenable(),
		gpu_depth : gpu_get_depth(),
		world_matrix : matrix_get(matrix_world)
	};
}
