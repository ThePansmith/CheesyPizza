//
// Skin-Choice Background Shader
// Copyright: RadixComet 2023
// ONLY AUTHORIZED FOR USE IN "Pizza Tower: Cheesed Up!"
// This Code is protected under United States Copyright law
// All Rights Reserved.

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
