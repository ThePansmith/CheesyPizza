//
// Simple Circle Clip Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_origin;
uniform float u_radius;
uniform float u_inverse;

void main()
{
	vec4 transparent = vec4(0.0, 0.0, 0.0, 0.0);
	
	vec4 game_out_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	float origin_distance = distance(v_vPosition, u_origin);
	
	if (u_inverse < 0.5)
		game_out_color = origin_distance < u_radius ? game_out_color : transparent;
	else
		game_out_color = origin_distance > u_radius ? game_out_color : transparent;
		
    gl_FragColor = game_out_color;
}
