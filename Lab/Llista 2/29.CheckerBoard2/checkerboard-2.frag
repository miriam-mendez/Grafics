#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;
uniform float n = 8;

const vec4 gris = vec4(0.8);
const vec4 negre = vec4(0);

void main()
{
    if (mod(floor(vtexCoord.s*n),2.) == mod(floor(vtexCoord.t*n),2.)) fragColor = gris;
    else fragColor = negre;
}
