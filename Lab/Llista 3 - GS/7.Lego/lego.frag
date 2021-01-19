#version 330 core

in vec2 gtexCoord;
in vec4 gfrontColor;
in vec3 gnormal;
in float top;

out vec4 fragColor;

uniform sampler2D colorMap;

void main()
{
    if (top == 1) fragColor = gfrontColor*texture(colorMap,gtexCoord);
    else fragColor = gfrontColor;
}
