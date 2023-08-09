function cyop_tilelayer(_sprite) constructor
{
	vertex_format = cyop_tilemap_create_vertex_format();
	vertex_buffer = vertex_create_buffer();
	texture = sprite_get_texture(_sprite, 0);
	sprite = _sprite;
	
	/// @desc	Build the vertex array from an array of "cyop_tile"
	/// @param	{array.cyop_tile} _tile_array
	/// @param	{real}	_depth
	/// @return	{bool}
	static Build = function(_tile_array, _depth)
	{
		var uvs = sprite_get_uvs(sprite);
		var spr_left = uvs[0];
		var spr_top = uvs[1];
		var spr_right = uvs[2];
		var spr_bottom = uvs[3];
		
		var tex_w = texture_get_texel_width(texture);
		var tex_h = texture_get_texel_height(texture);
		
		var tile_tex_w = tex_w * 32;
		var tile_tex_h = tex_h * 32;
		vertex_begin(vertex_buffer, vertex_format);
		for (var i = 0; i < array_length(_tile_array); i++)
		{
			var tile = _tile_array[i];
			// RX: we need a half texel offset depending on how this looks in game
			
			var tile_tex_x = (tile.tilemap_x * 32) + spr_left;
			var tile_tex_y = (tile.tilemap_y * 32) + spr_right;
			vertex_build_quad(vertex_buffer, tile.x, tile.y, 32, 32, c_white, 1, tile_tex_x, tile_tex_y, tile_tex_w, tile_tex_h);
		}
		vertex_end(vertex_buffer);
		vertex_freeze(vertex_buffer); // RX: Make the buffer readonly
	}
	
	/// @desc	Draws the tilemap
	static Draw = function()
	{
		vertex_submit(vertex_buffer, pr_trianglelist, texture);
	}
	
	/// @desc	Disposes of all unmanaged resources
	static Dispose = function()
	{
		vertex_delete_buffer(vertex_buffer);
		vertex_format_delete(vertex_format);
	}
}