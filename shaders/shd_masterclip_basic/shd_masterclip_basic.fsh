// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
// don't steal my fucking shaders

varying vec2 v_vPosition;
varying vec4 v_vColour;

/// Mask Clip////////////////////
uniform float u_domaskclip;
uniform sampler2D u_clip_sprite_texture;
uniform vec4 u_clip_sprite_uvs;
uniform vec2 u_clip_sprite_size;
uniform vec2 u_clip_sprite_texelsize;
uniform vec2 u_clip_sprite_worldposition;
uniform vec4 u_clip_sprite_trimmed;
uniform float u_mask_alphafix;
//////////////////////////////////

/// Circle Clip //////////////////
uniform float u_docircleclip;
uniform vec2 u_origin;
uniform float u_radius;
uniform float u_inverse;
uniform float u_circle_alphafix;
//////////////////////////////////

/// Rect Clip ////////////////////
uniform float u_dorectclip;
uniform vec4 u_clip_bounds;
uniform float u_rect_alphafix;
//////////////////////////////////

vec4 mask_clip(vec4 color)
{
	vec4 game_out_color = color;
		
	vec2 trimmed_world_size = vec2(u_clip_sprite_size - u_clip_sprite_trimmed.xy);
	
	vec2 trimmed_pos = u_clip_sprite_worldposition + u_clip_sprite_trimmed.xy;
	vec2 trimmed_size = u_clip_sprite_size * u_clip_sprite_trimmed.zw;
	
	// RX: are we inside the clip region?
	if	(
		(v_vPosition.x >= (trimmed_pos.x) && v_vPosition.x <= (trimmed_pos.x + trimmed_size.x)) && 
		(v_vPosition.y >= (trimmed_pos.y) && v_vPosition.y <= (trimmed_pos.y + trimmed_size.y))
		)
	{
		vec2 position_in_clip = ((v_vPosition - u_clip_sprite_worldposition - u_clip_sprite_trimmed.xy) * u_clip_sprite_texelsize) + u_clip_sprite_uvs.xy;
		
		vec4 clip_color = texture2D(u_clip_sprite_texture, position_in_clip);
		
		game_out_color *= clip_color;
	}
	else
		game_out_color = vec4(0.0, 0.0, 0.0, 0.0); // RX: Outside so it will be invisible
		
	if (u_mask_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
		
	return game_out_color;
}

vec4 circle_clip(vec4 color)
{
	vec4 game_out_color = color;
	
	float origin_distance = distance(v_vPosition, u_origin);
	
	if (u_inverse < 0.5)
		game_out_color.a = origin_distance < u_radius ? game_out_color.a : 0.0;
	else
		game_out_color.a = origin_distance > u_radius ? game_out_color.a : 0.0;
		
	if (u_circle_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
	return game_out_color;
}

bool rx_Vec4ContainsVec2(vec4 rect, vec2 pos)
{
	return ((rect.x - 1.0) <= pos.x && (rect.y - 1.0) <= pos.y && (rect.z + 1.0) >= pos.x && (rect.w + 1.0) >= pos.y);
}

vec4 rect_clip(vec4 color)
{
	vec4 game_out_color = color;
	
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
	
	if (u_rect_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
		
	return game_out_color;
}
void main()
{
	vec4 game_out_color =  v_vColour;
	
	if (u_docircleclip > 0.5)
		game_out_color = circle_clip(game_out_color);
		
	if (u_domaskclip > 0.5)
		game_out_color = mask_clip(game_out_color);
	
	if (u_dorectclip > 0.5)
		game_out_color = rect_clip(game_out_color);
		
    gl_FragColor = game_out_color;
}
