#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;
uniform float n = 4;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(N.z);
    
    vec3 F = (modelViewMatrixInverse*lightPosition).xyz;
    float d = distance(vertex,F);
    float w = clamp(1/pow(d,n),0,1);
    vec3 V = (1.0-w)*vertex + w*F;
    
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
