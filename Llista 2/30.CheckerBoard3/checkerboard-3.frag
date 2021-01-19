#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;
uniform float n = 8;

const vec4 gris = vec4(0.8);
const vec4 negre = vec4(0);

void main()
{
    float x = floor(mod(n*10*vtexCoord.s,10));
    float y = floor(mod(n*10*vtexCoord.t,10));
    
    if (x == 0 || y == 0) fragColor = negre;
    else fragColor = gris;
}
