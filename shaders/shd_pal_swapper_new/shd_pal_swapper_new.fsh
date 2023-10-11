// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
// don't steal my fucking shaders

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float palette_index;

// Palette Image Stuff
uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;


void main()
{
	vec4 game_out_color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	
	
	
    gl_FragColor = v_vColour * game_out_color;
}
