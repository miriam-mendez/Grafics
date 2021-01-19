#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform float lines;

void main()
{
    fragColor = frontColor;
}
