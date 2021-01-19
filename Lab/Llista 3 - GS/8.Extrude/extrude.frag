#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
in vec3 gnormal;

uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix*gnormal);
    fragColor = vec4(N.z);
}
