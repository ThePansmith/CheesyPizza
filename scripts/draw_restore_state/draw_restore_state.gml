/// @func	draw_restire_state(state)
/// @desc	Restores the draw context to the provided state parameter
/// @param	{struct.DrawState}	state
function draw_restore_state(_state)
{
	gpu_set_blendmode(_state.blendmode)
	draw_set_color(_state.color);
	draw_set_alpha(_state.alpha);
	draw_set_font(_state.font);
	draw_set_valign(_state.valign);
	draw_set_halign(_state.halign);
}