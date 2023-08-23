//
// Simple Circle Clip Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
// don't steal my fucking shaders

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_origin;
uniform float u_radius;
uniform float u_inverse;
uniform float u_alphafix;

void main()
{
	vec4 game_out_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	float origin_distance = distance(v_vPosition, u_origin);
	
	if (u_inverse < 0.5)
		game_out_color.a = origin_distance < u_radius ? game_out_color.a : 0.0;
	else
		game_out_color.a = origin_distance > u_radius ? game_out_color.a : 0.0;
	if (u_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
    gl_FragColor = game_out_color;
}
