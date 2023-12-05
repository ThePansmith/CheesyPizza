varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

// patterns
uniform sampler2D pattern_texture;
uniform int pattern_enabled; // there's no gml function to set a bool
uniform float color_array[2]; // indices of the colors that the pattern should replace
uniform vec4 pattern_tex_data; // (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec4 pattern_UVs;
uniform vec4 sprite_UVs;
uniform vec4 sprite_tex_data; // (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec2 sprite_scale; // (xscale, yscale)
uniform vec2 pattern_offset;
uniform float shade_multiplier; // seemingly unused for now

// custom palettes
uniform int custom_enable;
uniform float palette_override[64];
#define TOLERANCE 0.004

void main()
{
	vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
	DoAlphaTest( source ); // discards pixel if alpha is 0
    
	for(float color_index = palette_UVs.y; color_index < palette_UVs.w; color_index += texel_size.y) // iterate through each color
	{
		float raw_color_index = (color_index - palette_UVs.y) / texel_size.y;
		vec4 palette_color = texture2D(palette_texture, vec2(palette_UVs.x, color_index));
		
		if (distance(source, palette_color) <= TOLERANCE) // Difference between colors
		{
			if (custom_enable == 1)
			{
				// custom palettes
				// palette_override: [r,g,b,a,    r,g,...]
				
				int index = int(raw_color_index * 4.0);
				source = vec4(palette_override[index], palette_override[index + 1], palette_override[index + 2], palette_override[index + 3]);
			}
			else
			{
				float texel_palette_offset = texel_size.x * palette_index;
				float palette_V = palette_UVs.x + texel_palette_offset;
				vec4 prev_source = source;
				source = texture2D(palette_texture, vec2(palette_V, color_index)); // Palette color at specific offset
			}
			
			if (pattern_enabled == 1) 
			{
				for(int j = 0; j <= 1; j += 1) // check for normal or shading.
				{
					if (color_array[j] == floor((color_index - palette_UVs.y) * (1.0 / texel_size.y))) 
					{
						// convert to (0,0) and convert to integer size in texture page
						vec2 pos = (v_vTexcoord - sprite_UVs.xy) * sprite_tex_data.zw;
						
						// get the edges of the palette sprite and convert to integer size in texture page
						vec2 edge = (pattern_UVs.zw - pattern_UVs.xy) * pattern_tex_data.zw;
						
						pos += pattern_offset;
						
						// wrap around the edges
						pos = mod(pos + sprite_tex_data.xy, edge + pattern_tex_data.xy);
						
						// convert the position back to texel size
						pos = pos / pattern_tex_data.zw;
		
						// set the tex coordinate
						vec2 texcoord = vec2(0, 0);
		
						// check sprite xscale
						if (sprite_scale.x >= 0.0)
							texcoord.x = pattern_UVs.x + pos.x;
						else
							texcoord.x = pattern_UVs.z - pos.x;
			
						// check sprite yscale
						if (sprite_scale.y >= 0.0)
							texcoord.y = pattern_UVs.y + pos.y;
						else
							texcoord.y = pattern_UVs.w - pos.y;
						
						// mix the pattern and the palette colors
						vec4 pat = texture2D(pattern_texture, texcoord);
						
						// Darken
						vec4 shadeColor = vec4(0.0, 0.0, 0.0, 0.40625);
						if (j != 1) // If it is not the second pass
							shadeColor.a = 0.0;
						
						//if (source.rgb == vec3(0.0, 0.0, 0.0))
						//	source.a *= source.a;

						vec3 m = mix(pat.rgb, shadeColor.rgb, shadeColor.a * shade_multiplier);
						
						// Radix what the fuck is the point of this
						//if (source.rgb == vec3(0.0, 0.0, 0.0) && (source.a != 0.0 && source.a != 1.0))
						//	m.rgb = mix(m.rgb, vec3(0.0, 0.0, 0.0), source.a);
							
						source = vec4(m.rgb, pat.a);
						break;
					}
				}
			}
			break;
		}
	}

	gl_FragColor = source * v_vColour;
}
