#version 330 core

out vec4 fragColor;

const vec4 gris = vec4(0.8);
const vec4 negre = vec4(0);

in vec2 vtexCoord;

void main()
{
    if (mod(floor(vtexCoord.s*8),2.) == mod(floor(vtexCoord.t*8),2.)) fragColor = gris;
    else fragColor = negre;
}
