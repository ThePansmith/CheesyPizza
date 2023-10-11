varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float panic;
uniform sampler2D background;
uniform float use_background_sampler;

//DDP You can change these values to tweak how intense the background is
#define WAVELENGTH 48.0
#define AMPLITUDE 0.005
#define TINTAMOUNT 0.5
#define TINTSPEED 2.0

void main()
{
	// Wobble back and forth more with time.
	vec2 uv = v_vTexcoord;
	uv.x += sin(WAVELENGTH * uv.y + 3.0 * time/* * panic*/) * AMPLITUDE * panic;
	
	// Tint background more with time.
	vec4 texel = texture2D(gm_BaseTexture, uv);
	
	if (use_background_sampler > 0.5)
		texel = texture2D(background, uv);
	texel.r += (0.5 + 0.5 * sin(TINTSPEED * time/* * panic*/)) * TINTAMOUNT * panic;
	
	gl_FragColor = texel;
}
