function shader_set_circleclip(_originx, _originy, _clip_radius, _alphafix = false)
{
	shader_set(shd_circleclip);
	var origin_pos = shader_get_uniform(shd_circleclip, "u_origin");
	var radius_pos = shader_get_uniform(shd_circleclip, "u_radius");
	var alphafix_pos = shader_get_uniform(shd_circleclip, "u_alphafix");
	shader_set_uniform_f(origin_pos, _originx, _originy);
	shader_set_uniform_f(radius_pos, _clip_radius);
	shader_set_uniform_f(alphafix_pos, _alphafix ? 1.0 : 0.0);
}