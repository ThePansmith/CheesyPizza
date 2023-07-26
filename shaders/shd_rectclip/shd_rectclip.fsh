//
// Simple Rectangle Clip Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 v_vPosition;

uniform vec4 u_clip_bounds;

bool rx_Vec4ContainsVec2(vec4 rect, vec2 pos)
{
	return ((rect.x - 1.0) <= pos.x && (rect.y - 1.0) <= pos.y && (rect.z + 1.0) >= pos.x && (rect.w + 1.0) >= pos.y);
}

void main()
{
	vec4 game_out_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec4 clip_bounds = u_clip_bounds;
	
	if (clip_bounds.z < 0.0)
	{
		clip_bounds.x = clip_bounds.x + clip_bounds.z;
		clip_bounds.z = -clip_bounds.z;
	}
	
	if (clip_bounds.w < 0.0)
	{
		clip_bounds.y = clip_bounds.y + clip_bounds.w;
		clip_bounds.w = -clip_bounds.w;
	}
	
	game_out_color.a = rx_Vec4ContainsVec2(clip_bounds, v_vPosition) ? game_out_color.a : 0.0;
	
    gl_FragColor = game_out_color;
}
