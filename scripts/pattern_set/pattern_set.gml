function pattern_set(color_array, sprite, subimg, xscale, yscale, pattern, pattern_subimage = global.Pattern_Index, pattern_xoffset = 0, pattern_yoffset = 0)
{
	static shade_multiplier = shader_get_uniform(shd_pal_swapper, "shade_multiplier");
    if pattern == noone
        exit;
	
	shader_set(shd_pal_swapper);
    pattern_enable(true);
	
    pattern_set_pattern(pattern, pattern_subimage);
    pattern_set_sprite(sprite, subimg, xscale, yscale, sprite_get_xoffset(pattern) + pattern_xoffset, sprite_get_yoffset(pattern) + pattern_yoffset);
    pattern_set_color_array(color_array);
	
	shader_set_uniform_f(shade_multiplier, 1);
}
function pattern_set_temp(color_array, sprite, subimg, xscale, yscale, pattern, pattern_subimage = global.Pattern_Index,  pattern_xoffset = 0, pattern_yoffset = 0)
{
	static shade_multiplier = shader_get_uniform(shd_pal_swapper, "shade_multiplier");
	if pattern == noone
        exit;
	
	shader_set(shd_pal_swapper);
	pattern_enable(true);
	
	// Pattern Texture
	var _texT = sprite_get_texture(pattern, pattern_subimage);
	var _uvsT = sprite_get_uvs(pattern, pattern_subimage);
	
    texture_set_stage(global.Pattern_Texture, _texT);
    texture_set_interpolation_ext(global.Pattern_Texture, false);
    shader_set_uniform_f(global.Pattern_UVs, _uvsT[0], _uvsT[1], _uvsT[2], _uvsT[3]);
    shader_set_uniform_f(global.Pattern_Tex_Data, _uvsT[4], _uvsT[5], texture_get_width(_texT) / texture_get_texel_width(_texT), texture_get_height(_texT) / texture_get_texel_height(_texT));
	
	// Sprite
	var _texS = sprite_get_texture(sprite, subimg);
	var _uvsS = sprite_get_uvs(sprite, subimg);
	
    shader_set_uniform_f(global.Pattern_Spr_UVs, _uvsS[0], _uvsS[1], _uvsS[2], _uvsS[3]);
    shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvsS[4], _uvsS[5], texture_get_width(_texS) / texture_get_texel_width(_texS), texture_get_height(_texS) / texture_get_texel_height(_texS));
    shader_set_uniform_f(global.Pattern_Spr_Scale, xscale, yscale);
	shader_set_uniform_f(shader_get_uniform(shd_pal_swapper, "pattern_offset"), sprite_get_xoffset(pattern) + pattern_xoffset, sprite_get_yoffset(pattern) + pattern_yoffset);
	
	// Color Array
	shader_set_uniform_f_array(global.Pattern_Color_Array, color_array);
	
	shader_set_uniform_f(shade_multiplier, 1);
}
