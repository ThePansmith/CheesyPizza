//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_texture_page;

uniform vec4 u_sprite_uvs;

uniform float u_layer1_info[8];
uniform float u_layer2_info[8];
uniform float u_layer3_info[8];
uniform float u_layer4_info[8];

uniform vec2 u_layer_offsets[4];

void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

	//float perc_x = (v_vTexcoord.x - u_sprite_uvs.x) / (u_sprite_uvs.z - u_sprite_uvs.x);
	//float perc_y = (v_vTexcoord.y - u_sprite_uvs.y) / (u_sprite_uvs.w - u_sprite_uvs.y);
	float perc_x = (v_vTexcoord.x - u_sprite_uvs.x) / (u_sprite_uvs.z - u_sprite_uvs.x);
	float perc_y = (v_vTexcoord.x - u_sprite_uvs.x) / (u_sprite_uvs.z - u_sprite_uvs.x);
	if (game_out_color.a != 0.0 && game_out_color.rgb != vec3(0.0, 0.0, 0.0))
	{
		// RX: layer
		vec2 lay_1_size = vec2(u_layer1_info[2] - u_layer1_info[0], u_layer1_info[3] - u_layer1_info[1]);
		
		vec4 lay_1_color = texture2D(u_texture_page, vec2(u_layer1_info[0] + (u_layer1_info[6] * perc_x), u_layer1_info[1] + (u_layer1_info[7] * perc_y)));
		game_out_color = lay_1_color;
	
	}
    gl_FragColor = game_out_color;
}
