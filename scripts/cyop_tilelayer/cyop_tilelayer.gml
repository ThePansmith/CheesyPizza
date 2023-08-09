function cyop_tilelayer() constructor
{
	vertex_format = cyop_tilemap_create_vertex_format();
	vertex_buffers = [];
	textures = [];
	
	
	/// @desc	Build the vertex array from an array of "cyop_tile"
	/// @param	{array.cyop_tile} _tile_array
	/// @param	{real}	_depth
	/// @return	{bool}
	static Build = function(_tile_array, _depth)
	{
		#region Sort by Texture
		// RX: First sort everything by texture
		var sorted_map = ds_map_create();
		for (var i = 0; i < array_length(_tile_array); i++)
		{
			var tile = _tile_array[i];
			var tile_texture = sprite_get_texture(tile.sprite, tile.subimage);
			
			if (ds_map_exists(sorted_map, tile_texture))
			{
				var len = array_length(sorted_map[?tile_texture]);
				sorted_map[?tile_texture][len] = tile;
			}
			else
			{
				ds_map_add(sorted_map, tile_texture, [ tile ]);
				var len = ds_map_size(sorted_map);
				vertex_buffers[len] = vertex_create_buffer();
				textures[len] = tile_texture;
			}
		}
		#endregion
		// RX: Everything should be sorted now, hopefully
		
		// RX: Now build each vertex buffer
		for (var tex_it = 0; tex_it < array_length(textures); tex_it++)
		{
			var texture = textures[tex_it];
			var tex_w = texture_get_texel_width(texture);
			var tex_h = texture_get_texel_height(texture);
			
			vertex_begin(vertex_buffers[tex_it], vertex_format);
			for (var tile_it = 0; tile_it < array_length(sorted_map[?texture]); tile_it++)
			{
				var tile = sorted_map[?texture][tile_it];
				var uvs = sprite_get_uvs(tile.sprite, tile.subimage);
				var uv_left = uvs[0];
				var uv_top = uvs[1];
				
				var tile_tex_size_x = tile.size_x * tex_w;
				var tile_tex_size_y = tile.size_y * tex_h;
				
				var tile_tex_pos_x = (tile.tm_x * tile_tex_size_x) + uv_left;
				var tile_tex_pos_y = (tile.tm_y * tile_tex_size_y) + uv_top;
				
				vertex_build_quad3D(vertex_buffers[tex_it], 
								tile.x, tile.y, _depth, tile.size_x,  tile.size_y,// Pos and Size
							    c_white, 1, // Color and Opacity
								tile_tex_pos_x, tile_tex_pos_y, tile_tex_size_x, tile_tex_size_y);
				
								
			}
			vertex_end(vertex_buffers[tex_it]);
			vertex_freeze(vertex_buffers[tex_it]); // RX: Make it readonly
		}
		
		// RX: Cleanup
		ds_map_destroy(sorted_map);
	}
	
	/// @desc	Draws the tilemap
	static Draw = function()
	{
		for (var i = 0; i < array_length(textures); i++)
			vertex_submit(vertex_buffers[i], pr_trianglelist, textures[i]);	
		
	}
	
	/// @desc	Disposes of all unmanaged resources
	static Dispose = function()
	{
		for (var i = 0; i < array_length(vertex_buffers); i++)
			vertex_delete_buffer(vertex_buffers[i]);	
		
		vertex_format_delete(vertex_format);
	}
}