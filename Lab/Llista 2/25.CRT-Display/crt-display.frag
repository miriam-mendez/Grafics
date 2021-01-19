#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 5; //un frag de cada n linies es pinta

void main()
{
    if (floor(mod(gl_FragCoord.y,n)) == 0) fragColor = frontColor;
    else discard;
}
