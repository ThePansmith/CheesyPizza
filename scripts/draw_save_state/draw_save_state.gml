/// @func draw_save_state
/// @desc	Saves the current state of drawing and returns a 
/// @return  {struct.DrawState}
function draw_save_state()
{
	return {
		blendmode : gpu_get_blendmode(),
		color : draw_get_color(),
		alpha : draw_get_alpha(),
		font : draw_get_font(),
		valign : draw_get_valign(),
		halign : draw_get_halign()
	};
}