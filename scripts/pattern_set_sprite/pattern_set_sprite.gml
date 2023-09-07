function pattern_set_sprite(sprite, subimg, xscale, yscale, xoffset = 0, yoffset = 0)
{
    var _tex = sprite_get_texture(sprite, subimg);
    var _uvs = sprite_get_uvs(sprite, subimg);
    shader_set_uniform_f(global.Pattern_Spr_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
    shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvs[4], _uvs[5], texture_get_width(_tex) / texture_get_texel_width(_tex), texture_get_height(_tex) / texture_get_texel_height(_tex));
    shader_set_uniform_f(global.Pattern_Spr_Scale, xscale, yscale);
	shader_set_uniform_f(shader_get_uniform(shd_pal_swapper, "pattern_offset"), xoffset, yoffset);
}
