function cyop_tilelayer(_x, _y, _tilelayer, _depth, _secret) constructor
{
	if live_call(_x, _y, _tilelayer, _depth, _secret) return live_result;
	
	/// @desc	Prepare texture sorting and tile data
	Prepare = function(tilelayer)
	{
		if live_call(tilelayer) return live_result;
		
		var f = function(entry_name, i)
		{
			var this = tilelayer[$ entry_name]; // {tileset: str, coord: [x, y]}
			if entry_name == "ID" or !is_struct(this)
				exit;
			
			// prepare tile
			if this.tileset == noone
				exit;
			else if is_string(this.tileset)
			{
				// parse position
				var pos = string_split(entry_name, "_", true, 1);
				this.x = real(pos[0]) + x;
				this.y = real(pos[1]) + y;
				
				// cyop ignores DRAWING off grid tiles, apparently
				if frac(this.x / 32) != 0 or frac(this.y / 32) != 0
				{
					this.tileset = noone;
					exit;
				}
				
				// figure out sprite
				var sprite = SPRITES[? this.tileset];
				this.size = 32;
				
				if sprite == undefined
				{
					var custom = global.custom_tiles[? this.tileset];
					if custom != undefined
					{
						this.tileset = custom[0];
						this.size = custom[1];
					}
					else
					{
						this.tileset = noone;
						exit;
					}
				}
				else
					this.tileset = sprite;
				
				// tile coords outside of actual tileset
				if this.coord[0] * this.size >= sprite_get_width(this.tileset)
				or this.coord[1] * this.size >= sprite_get_height(this.tileset)
				{
					this.tileset = noone;
					exit;
				}
			}
			array_push(tiles, this);
			
			// sort by texture
			var tile_texture = sprite_get_texture(this.tileset, 0);
			
			var existing_array = sorted_map[?tile_texture];
			if existing_array != undefined
				array_push(existing_array, this);
			else
			{
				var len = ds_map_size(sorted_map);
				ds_map_set(sorted_map, tile_texture, [ this ]);
				
				vertex_buffers[len] = vertex_create_buffer();
				textures[len] = tile_texture;
			}
		};
		
		var tiles = variable_struct_get_names(tilelayer);
		array_foreach(tiles, f, 0, infinity);
	}
	
	/// @desc	Build the vertex array from the array
	Build = function()
	{
		if live_call() return live_result;
		
		// RX: Build each vertex buffer
		var f = function(texture, tex_it)
		{
			var tex_w = texture_get_texel_width(texture);
			var tex_h = texture_get_texel_height(texture);
			
			vertex_begin(vertex_buffers[tex_it], vertex_format);
			
			var f = method({tex_it: tex_it, tex_w: tex_w, tex_h: tex_h, depth: depth, vertex_buffers: vertex_buffers}, function(tile, tile_it)
			{
				if ds_list_find_index(global.cyop_broken_tiles, $"{tile.x}_{tile.y}") != -1
					exit;
				
	            var uvs = sprite_get_uvs(tile.tileset, 0);
	            var uv_left = uvs[0];
	            var uv_top = uvs[1];
                
	            var tile_trim_x = uvs[4];
	            var tile_trim_y = uvs[5];
                
	            var tile_tex_size_x = tile.size * tex_w;
	            var tile_tex_size_y = tile.size * tex_h;
                
	            var tile_tex_pos_x = ((tile.coord[0] - (tile_trim_x / tile.size)) * tile_tex_size_x) + uv_left;
	            var tile_tex_pos_y = ((tile.coord[1] - (tile_trim_y / tile.size)) * tile_tex_size_y) + uv_top;
				
	            vertex_build_quad3D(vertex_buffers[tex_it], 
	                tile.x, tile.y, depth, 32, 32, // Pos and Size
	                c_white, 1, // Color and Opacity
	                tile_tex_pos_x, tile_tex_pos_y, tile_tex_size_x, tile_tex_size_y
				);
			});
			array_foreach(sorted_map[?texture], f, 0, infinity);
			
			vertex_end(vertex_buffers[tex_it]);
			//vertex_freeze(vertex_buffers[tex_it]); // RX: Make it readonly
		};
		array_foreach(textures, f, 0, infinity);
	}
	
	/// @desc	Draws the tilemap
	Draw = function()
	{
		if live_call() return live_result;
		
		// rebuild
		if dirty
		{
			for(var i = 0; i < array_length(vertex_buffers); i++)
			{
				vertex_delete_buffer(vertex_buffers[i]);
				vertex_buffers[i] = vertex_create_buffer();
			}
			
			Build();
			dirty = false;
		}
		
		// draw
		var f = function(tex, i) {
			vertex_submit(vertex_buffers[i], pr_trianglelist, tex);
		}
		array_foreach(textures, f, 0, infinity);
		
		/*
		for(var i = 0; i < array_length(tiles); i++)
		{
			var t = tiles[i];
			draw_set_color(c_red);
			draw_text(t.x + mouse_x, t.y + mouse_y, t.coord);
		}
		*/
	}
	
	/// @desc	Disposes of all unmanaged resources
	Dispose = function()
	{
		if live_call() return live_result;
		
		for (var i = 0; i < array_length(vertex_buffers); i++)
			vertex_delete_buffer(vertex_buffers[i]);
		
		vertex_format_delete(vertex_format);
		ds_map_destroy(sorted_map);
	}
	
	// set up
	sorted_map = ds_map_create();
	vertex_format = cyop_tilemap_create_vertex_format();
	vertex_buffers = [];
	textures = [];
	tiles = [];
	dirty = false;
	
	x = _x;
	y = _y;
	tilelayer = _tilelayer;
	depth = _depth;
	
	Prepare(tilelayer);
}
