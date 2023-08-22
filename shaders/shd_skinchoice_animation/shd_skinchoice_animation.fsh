//
// Skinchoice Animation Mask Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
// RX: just don't fucking steal my fucking shaders oh my fucking god

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

/////////////////////////// Circle Clip ///
uniform vec2 u_origin;
uniform float u_radius;
uniform float u_inverse;
uniform float u_alphafix;
///////////////////////////////////////////


void main()
{
	
	/// Circle Clip
	vec4 game_out_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	float origin_distance = distance(v_vPosition, u_origin);
	if (u_inverse < 0.5)
		game_out_color.a = origin_distance < u_radius ? game_out_color.a : 0.0;
	else
		game_out_color.a = origin_distance > u_radius ? game_out_color.a : 0.0;
	if (u_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
	/// End of circle clip
	
	
    gl_FragColor = game_out_color;
}
