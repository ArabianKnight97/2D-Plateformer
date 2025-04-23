// Black and white fragment shader
uniform float amount;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 darkerColor = vec3(texColor.r - amount, texColor.g - amount, texColor.b - amount);
    gl_FragColor = v_vColour * vec4(darkerColor, texColor.a);
}