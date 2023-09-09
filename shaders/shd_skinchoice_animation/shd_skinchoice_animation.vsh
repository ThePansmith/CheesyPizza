//
// Skinchoice Animation Mask Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
// RX: just don't fucking steal my fucking shaders oh my fucking god
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;
uniform vec2 u_texcoord_center;
uniform vec2 u_sprite_size;
uniform float u_curve;
void main()
{
    
	//vec2 texcoords = in_TextureCoord;
	//vec2 texcoord_center = vec2(in_TextureCoord.x + (u_texcoord_size.x / 2.0), in_TextureCoord.y + (u_texcoord_size.y / 2.0));
	//vec2 texcoord_offset = vec2(texcoord_center.x - in_TextureCoord.x, texcoord_center.y - in_TextureCoord.y);
	
	//texcoords = vec2(texcoord_center.x + (texcoord_offset.x * u_curve), texcoord_center.y + (texcoord_offset.y * u_curve));
	
	vec2 position = in_Position.xy;
	vec2 position_center = vec2(0.0, 0.0);
	
	if (in_TextureCoord.x < u_texcoord_center.x)
		position_center.x = in_Position.x + (u_sprite_size.x / 2.0);
	else
		position_center.x = in_Position.x - (u_sprite_size.x / 2.0);
		
	if (in_TextureCoord.y < u_texcoord_center.y)
		position_center.y = in_Position.y + (u_sprite_size.x / 2.0);
	else
		position_center.y = in_Position.y - (u_sprite_size.x / 2.0);
		
	//vec2 position_center = vec2(in_Position.x + (u_texcoord_size.x / 2.0), in_Position.y + (u_texcoord_size.y / 2.0));
	vec2 position_offset = vec2(in_Position.x - position_center.x, in_Position.y - position_center.y);
	
	vec4 object_space_pos = vec4( position_center.x + (position_offset.x * u_curve), position_center.y + (position_offset.y * u_curve), in_Position.z, 1.0 );
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	v_vPosition = in_Position.xy;
}
