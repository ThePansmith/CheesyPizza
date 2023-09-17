//
// Simple Sprite Mask Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
// don't steal my fucking shaders

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


uniform sampler2D u_clip_sprite_texture;
uniform vec4 u_clip_sprite_uvs;
uniform vec2 u_clip_sprite_size;
uniform vec2 u_clip_sprite_texelsize;
uniform vec2 u_clip_sprite_worldposition;
uniform vec4 u_clip_sprite_trimmed;
uniform float u_alphafix;

/// Circle Clip //////////////////
uniform float u_doclip;
uniform vec2 u_origin;
uniform float u_radius;
uniform float u_inverse;
/////////////////////////////////

void main()
{
	vec4 game_out_color =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
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
		
		// RX: clamp to inside of uvs
		//if (position_in_clip.x < u_clip_sprite_uvs.x)
		//	position_in_clip.x = u_clip_sprite_uvs.x;
			
		//if (position_in_clip.x > u_clip_sprite_uvs.z)
		//	position_in_clip.x = u_clip_sprite_uvs.z;
			
		//if (position_in_clip.y < u_clip_sprite_uvs.y)
		//	position_in_clip.y = u_clip_sprite_uvs.y;
			
		//if (position_in_clip.y > u_clip_sprite_uvs.w)
		//	position_in_clip.y = u_clip_sprite_uvs.w;
			
		vec4 clip_color = texture2D(u_clip_sprite_texture, position_in_clip);
		
		game_out_color *= clip_color;
	}
	else
		game_out_color = vec4(0.0, 0.0, 0.0, 0.0); // RX: Outside so it will be invisible
	if (u_doclip > 0.5)
	{
		float origin_distance = distance(v_vPosition, u_origin);
	
		if (u_inverse < 0.5)
			game_out_color.a = origin_distance < u_radius ? game_out_color.a : 0.0;
		else
			game_out_color.a = origin_distance > u_radius ? game_out_color.a : 0.0;
	}
	if (u_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
    gl_FragColor = game_out_color;
}
