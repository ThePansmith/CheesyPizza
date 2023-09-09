/// @func	shader_set_rectclip(x, y, width, height, alpha_fix, simple)
/// @desc	Sets the current shader to the rectclip shader, returns false if shaders aren't supported, returns true otherwise
/// @arg	{real}	_x	X-Position of the clip region
/// @arg	{real}	_y	Y-Position of the clip region
/// @arg	{real}	_width	Width of the clip region
/// @arg	{real}	_height	Height of the clip region
/// @arg	{bool}	_alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @arg	{bool}	_simple			Use the simple version of the shader, enable this for your "draw_circle"/"draw_ellipse"/"draw_rectangle"/"draw_triangle" functions
/// @returns	{bool}
function shader_set_rectclip(_x, _y, _width, _height, _alpha_fix = false, _simple = false)
{
	if global.performance
		return false;
	var shader = _simple ? shd_rectclip_basic : shd_rectclip;
	shader_set(shader);
	var clip_bounds_pos = shader_get_uniform(shader, "u_clip_bounds");
	var alphafix_pos = shader_get_uniform(shader, "u_alphafix");
	shader_set_uniform_f(clip_bounds_pos, _x, _y, _width, _height);
	shader_set_uniform_f(alphafix_pos, _alpha_fix ? 1.0 : 0.0);
	return true;
}