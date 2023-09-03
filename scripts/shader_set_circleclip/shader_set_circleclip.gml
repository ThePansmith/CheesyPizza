/// @desc	Sets the current shader to the circleclip shader, returns false if shaders aren't supported, returns true otherwise
/// @arg	{real}	_origin_x	X-Position of the circle clip
/// @arg	{real}	_origin_y	Y-Position of the circle clip
/// @arg	{real}	_clip_radius	The radius of the clip in pixels
/// @arg	{bool}	_alpha_fix		Simulate the alphafix to all pixels inside the clip
/// @arg	{bool}	_simple			Use the simple version of the shader, enable this for your "draw_circle"/"draw_ellipse"/"draw_rectangle"/"draw_triangle" functions
/// @returns	{bool}
function shader_set_circleclip(_origin_x, _origin_y, _clip_radius, _alpha_fix = false, _simple = false)
{
	if global.performance
		return false;
	
	var shader = _simple ? shd_circleclip_basic : shd_circleclip;
	shader_set(shader);
	var origin_pos = shader_get_uniform(shader, "u_origin");
	var radius_pos = shader_get_uniform(shader, "u_radius");
	var alphafix_pos = shader_get_uniform(shader, "u_alphafix");
	shader_set_uniform_f(origin_pos, _origin_x, _origin_y);
	shader_set_uniform_f(radius_pos, _clip_radius);
	shader_set_uniform_f(alphafix_pos, _alpha_fix ? 1.0 : 0.0);
	return true;
}
