//
// Simple passthrough fragment shader
// Shader by RadixComet
// only for cheesed up
// don't fucking steal my code

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

#define VEC2_EMPTY vec2(0.0, 0.0)

uniform float u_secret_block_info[256];
uniform vec2 u_tile_size;
uniform vec2 u_list_size;

bool point_in_rect(float px, float py, float xx, float yy, float ww, float hh)
{
	if (ww == 0.0 || hh == 0.0)
		return false;
		
	return px > xx && px < (xx + ww) && py > yy && py < (yy + hh); 
}

bool vec2_equal(vec2 lhs, vec2 rhs)
{
	return lhs.x == rhs.x && lhs.y == rhs.y;
}
void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	bool broke = false;
	
	for (int i = 0; i < int(u_list_size); i += 2)
	{
		vec2 pos = vec2(u_secret_block_info[i + 0], u_secret_block_info[i + 1]);
		
		//if (i < 256) // RX: check if we are at the end of the list
		//{
		//	vec2 peek = vec2(u_secret_block_info[i + 2], u_secret_block_info[i + 3]);
		//	if (vec2_equal(pos, VEC2_EMPTY) && vec2_equal(peek, VEC2_EMPTY))
		//		break; // RX: We will never have duplicates.
		//}

		if (point_in_rect(v_vPosition.x, v_vPosition.y, pos.x, pos.y, u_tile_size.x, u_tile_size.y))
		{
			broke = true;
			break;
		}
	}
	
	gl_FragColor = vec4(game_out_color.rgb, (1.0 - float(broke)) * game_out_color.a);

}
