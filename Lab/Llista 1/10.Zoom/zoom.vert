#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    
    vec4 vertexClip = modelViewProjectionMatrix * vec4(vertex, 1.0); //vertex en clip space
    float s = 0.5 + abs(sin(time)); //escalat
    
    vec3 vertexNDC = vertexClip.xyz/vertexClip.w; //vertex en NDC
    vec4 vertexEscalat = vec4(s*vertexNDC.x, s* vertexNDC.y, vertexNDC.z, 1.0);
    gl_Position = vertexEscalat;
}
