/// @description Build Pizza Vertex Array
// RX: Build a Vertex layout


// RX: These are the raw texture coordinates we need
var uvs = sprite_get_uvs(spr_skinmenupizza, bg_image);
var tex = sprite_get_texture(spr_skinmenupizza, bg_image);
var tex_width = texture_get_texel_width(tex);
var tex_height = texture_get_texel_height(tex);

var uv_info = {
	left : uvs[0],
	top : uvs[1],
	right : uvs[2],
	bottom : uvs[3],
	left_trim : uvs[4],
	top_trim : uvs[5]
}

var pizza_width = sprite_get_width(spr_skinmenupizza);
var pizza_height = sprite_get_height(spr_skinmenupizza);


// RX: We start at -<width/height> to screensize + <width/height> because we want to overdraw for the
// translation matrix (the thing that moves the pizzas)
vertex_begin(vertex_buffer, vertex_format);
		
for (var xx = -pizza_width; xx < SCREEN_WIDTH + pizza_width; xx += pizza_width)
{
	for (var yy = -pizza_height; yy < SCREEN_HEIGHT + pizza_height; yy += pizza_height)
	{
		// RX: We have to push data in this order:
		// 1) position
		// 2) color
		// 3) tex coords
		// and it has to be in the form of tris, but I made a function for you
		
		var pos_left = bg_pos + xx + 5;
		var pos_top =  bg_pos + yy + 6;
		var pos_right = bg_pos + xx + pizza_width - 4;
		var pos_bottom = bg_pos + yy + pizza_height - 4;
		
		// RX: we need to break the quad into 2 tris (in CW order)
		// 0 -- 1 
		// |  / |
		// | /  |
		// 2 -- 3
		var color = c_white;
		var alpha = 0.25;
		vertex_build_point(vertex_buffer, pos_left, pos_top, color, alpha, uv_info.left, uv_info.top); // 0
		vertex_build_point(vertex_buffer, pos_right, pos_top, color, alpha, uv_info.right, uv_info.top); // 1
		vertex_build_point(vertex_buffer, pos_left, pos_bottom, color, alpha, uv_info.left, uv_info.bottom); // 2
		
		vertex_build_point(vertex_buffer, pos_right, pos_top, color, alpha, uv_info.right, uv_info.top); // 1
		vertex_build_point(vertex_buffer, pos_right, pos_bottom, color, alpha, uv_info.right, uv_info.bottom); // 3
		vertex_build_point(vertex_buffer, pos_left, pos_bottom, color, alpha, uv_info.left, uv_info.bottom); // 2
	}
}
vertex_end(vertex_buffer);