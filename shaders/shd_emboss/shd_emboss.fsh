//
// Emboss Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


vec4 sample_pixel(float dx, float dy)
{
	return texture2D(gm_BaseTexture, v_vTexcoord + vec2(dx, dy));
}

void build_matrix_mean(inout vec4[9] color_matrix)
{
	for (int i = 0; i < 9; i++)
	{
		color_matrix[i].a = (color_matrix[i].r + color_matrix[i].g + color_matrix[i].b) / 3.0;
	}
}
void build_color_matrix(out vec4[9] color_matrix)
{
	float dxtex = 0.0015;
	float dytex = 0.0015;
	
	color_matrix[0] = sample_pixel(-dxtex, -dytex);
	color_matrix[1] = sample_pixel(-dxtex, 0.0);
	color_matrix[2] = sample_pixel(-dxtex, dytex);
	
	color_matrix[3] = sample_pixel(0.0, -dytex);
	color_matrix[4] = sample_pixel(0.0, 0.0);
	color_matrix[5] = sample_pixel(0.0, dytex);
	
	color_matrix[6] = sample_pixel(dxtex, -dytex);
	color_matrix[7] = sample_pixel(dxtex, 0.0);
	color_matrix[8] = sample_pixel(dxtex, dytex);
}

float convolve(in float[9] emboss_matrix, in float[9] color_matrix)
{
	float res = 0.0;
	
	for (int i = 0; i < 9; i++)
		res += emboss_matrix[i] * color_matrix[i];
		
	return clamp(res, 0.0, 1.0);
		
}

void main()
{
	float emboss_matrix[9];
	emboss_matrix[0] = -4.0;
	emboss_matrix[1] = -2.0;
	emboss_matrix[2] = -1.0;
	emboss_matrix[3] = -2.0;
	emboss_matrix[4] = 1.0;
	emboss_matrix[5] = 2.0;
	emboss_matrix[6] = 1.0;
	emboss_matrix[7] = 2.0;
	emboss_matrix[8] = 4.0;
	
	
	vec4 color_matrix[9];
	
	build_color_matrix(color_matrix);

	float color_matrix_r[9];
	float color_matrix_g[9];
	float color_matrix_b[9];
	
	for (int i = 0; i < 9; i++)
	{
		color_matrix_r[i] = color_matrix[i].r;
		color_matrix_g[i] = color_matrix[i].g;
		color_matrix_b[i] = color_matrix[i].b;
	}
	
	//build_matrix_mean(color_matrix_r);
	//build_matrix_mean(color_matrix_g);
	//build_matrix_mean(color_matrix_b);
	
	
	float convolved_r = convolve(emboss_matrix, color_matrix_r);
	float convolved_g = convolve(emboss_matrix, color_matrix_g);
	float convolved_b = convolve(emboss_matrix, color_matrix_b);
	
	gl_FragColor = vec4(convolved_r, convolved_g, convolved_b, sample_pixel(0.0, 0.0).a);
}
