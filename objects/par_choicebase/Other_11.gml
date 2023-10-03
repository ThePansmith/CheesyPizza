/// @description Build Pizza Vertex Array

if global.performance
	exit;

// raw texture coordinates
var uvs = sprite_get_uvs(spr_skinmenupizza, bg_image);
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

/*
	RX: We start at -<width/height> to screensize + <width/height> because we want to overdraw for the
	translation matrix (the thing that moves the pizzas)
*/

vertex_begin(pizza_vbuffer, vertex_format);
for (var xx = -pizza_width; xx < SCREEN_WIDTH + pizza_width; xx += pizza_width)
{
	for (var yy = -pizza_height; yy < SCREEN_HEIGHT + pizza_height; yy += pizza_height)
	{
		// RX: We have to push data in this order:
		// 1) position
		// 2) color
		// 3) tex coords
		// and it has to be in the form of tris, but I made a function for you
		
		var pos_left = xx + 5;
		var pos_top =  yy + 6;
		var pos_right = xx + pizza_width - 4;
		var pos_bottom = yy + pizza_height - 4;
		
		// RX: we need to break the quad into 2 tris (in CW order)
		// 0 -- 1 
		// |  / |
		// | /  |
		// 2 -- 3
		vertex_build_quad(pizza_vbuffer, 
			// drawing coords
			pos_left, pos_top, pos_right - pos_left, pos_bottom - pos_top,
			
			// color and alpha
			c_white, 0.25,
			
			// texture coords
			uv_info.left, uv_info.top, uv_info.right - uv_info.left, uv_info.bottom - uv_info.top
		);
	}
}
vertex_end(pizza_vbuffer);
vertex_freeze(pizza_vbuffer); // RX: Making it readonly makes it faster
