//
// Simple passthrough fragment shader
// Shader by RadixComet
// only for cheesed up
// don't fucking steal my code

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

#define SECRETBLOCK_COUNT_MAX 512
#define FLOAT_SIZE 4
// X Y
#define SECRETBLOCK_STRUCT_MEMBER_COUNT 2
#define SECRET_BLOCK_INFO_ARRAY_SIZE SECRETBLOCK_COUNT_MAX * FLOAT_SIZE * SECRETBLOCK_STRUCT_MEMBER_COUNT;

uniform float u_secret_block_info[SECRETBLOCK_COUNT_MAX * FLOAT_SIZE * SECRETBLOCK_STRUCT_MEMBER_COUNT];

void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	bool broken = false;
	
	
	for (float i = 0; i < SECRET_BLOCK_INFO_ARRAY_SIZE; i++)
	{
		
	}
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
