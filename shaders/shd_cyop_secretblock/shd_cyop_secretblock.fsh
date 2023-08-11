//
// Simple passthrough fragment shader
// Shader by RadixComet
// only for cheesed up
// don't fucking steal my code

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

#define SECRETBLOCK_COUNT_MAX 2048.0
// X Y
#define SECRETBLOCK_STRUCT_MEMBER_COUNT 2

uniform float u_secret_block_info[4096];
uniform float u_array_size;
uniform vec2 u_tile_size;

void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	bool broke = false;

	for (int i = 0; i < int(u_array_size); i++)
	{
		int index = i * 2;
		float xx = u_secret_block_info[index + 0];
		float yy = u_secret_block_info[index + 1];
		
		float right = (xx + u_tile_size.x);
		float bottom = (yy + u_tile_size.y);
		
		if (xx <= v_vPosition.x && v_vPosition.x <= right && yy <= v_vPosition.y && v_vPosition.y <= bottom)
		{
			broke = true;
			break;
		}
	}
	
    gl_FragColor = vec4(game_out_color.rgb, broke ? 0.0 : game_out_color.a);
}
