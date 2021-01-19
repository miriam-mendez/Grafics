#version 330 core

in vec4 frontColor;
in vec3 vnormalEye;
out vec4 fragColor;

void main()
{
    vec3 N = normalize(vnormalEye);
    fragColor = frontColor* N.z;
}
