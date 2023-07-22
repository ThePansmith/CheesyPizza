//
// Secret Tile Mask Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.

#define EPSILON 0.05
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vTile_Position;

uniform vec4 u_secret_tile_bounds;
uniform float u_secret_tile_alpha;

// REMIX STUFF
uniform float u_remix_flag;
uniform float u_secret_tile_clip_distance;
uniform vec2 u_secret_tile_clip_position;
uniform float u_secret_tile_fade_size;
uniform float u_secret_tile_fade_intensity;

bool rx_Vec4ContainsVec2(vec4 rect, vec2 pos)
{
	return (rect.x <= pos.x && rect.y <= pos.y && rect.z >= pos.x && rect.w >= pos.y);
}

void main()
{
	// World Coord Reference
	// 0 - - -> X+
	// |
	// |
	// V
	// Y+
	
	// lessThenEqual and greaterThanEqual were giving me compile errors??
	// Is it because of the HLSL conversion?
	
	vec4 gameOutColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (rx_Vec4ContainsVec2(u_secret_tile_bounds, v_vTile_Position)) // Is the secret tile in our draw bounds
	{
		if (u_remix_flag > 0.0)
		{
			float dist = abs(distance(v_vTile_Position, u_secret_tile_clip_position));
			float fade_begin = u_secret_tile_fade_size * u_secret_tile_clip_distance;
			
			// Are WE in the bounds of the secret tiles?
			if (rx_Vec4ContainsVec2(u_secret_tile_bounds, u_secret_tile_clip_position))
			{
				float fade = 0.0;
				if (dist > fade_begin)
					fade = (dist - fade_begin) / (u_secret_tile_clip_distance - fade_begin);
					
				gameOutColor = vec4(gameOutColor.rgb, fade * u_secret_tile_fade_intensity);
			}
				
		}
		else
			gameOutColor = vec4(gameOutColor.rgb, u_secret_tile_alpha);
	}
	
	gl_FragColor = gameOutColor; // We are outside of the range, so draw it normally
}
