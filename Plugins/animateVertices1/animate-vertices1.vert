#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float amplitude = 0.1;
uniform float freq = 2.5;
uniform float time;

const float pi = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(N.z);
    float d = amplitude * sin(2*pi*freq*time);
    gl_Position = modelViewProjectionMatrix * vec4(d + vertex, 1.0);
}
