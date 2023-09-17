/// @desc	Applies a circle clip to your current maskclip, returns false if shaders aren't supported or your current shader isn't a maskclip, otherwise returns true
/// @arg	{real}	_origin_x	X-Position of the circle clip
/// @arg	{real}	_origin_y	Y-Position of the circle clip
/// @arg	{real}	_clip_radius	The radius of the clip in pixels
/// @returns	{bool}
function shader_maskclip_apply_circleclip(_origin_x, _origin_y, _clip_radius)
{
	if global.performance || shader_current() != shd_maskclip
		return false;
		
	var doclip_pos = shader_get_uniform(shader_current(), "u_doclip");	
	var origin_pos = shader_get_uniform(shader_current(), "u_origin");
	var radius_pos = shader_get_uniform(shader_current(), "u_radius");
	shader_set_uniform_f(doclip_pos, 1.0);
	shader_set_uniform_f(origin_pos, _origin_x, _origin_y);
	shader_set_uniform_f(radius_pos, _clip_radius);
	return true;
}
