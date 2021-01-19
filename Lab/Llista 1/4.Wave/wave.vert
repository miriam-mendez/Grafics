#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float amp = 0.5;
uniform float freq = 0.25;
uniform float time;

const float pi = 3.141592;

mat3 rotateX(float a) {
    return mat3 (   vec3(1.0,0.0,0.0),
                    vec3(0.0, cos(a), sin(a)),
                    vec3(0.0, -sin(a), cos(a)));
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    
    float a = amp*sin(2*pi*freq*time + vertex.y);
    vec4 rotateVertex = vec4(rotateX(a)*vertex, 1.0);
    
    gl_Position = modelViewProjectionMatrix * rotateVertex;
}
