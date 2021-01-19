#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec4 matAmbient, matDiffuse, matSpecular;
uniform float matShininess;
uniform vec4 lightAmbient, lightDiffuse, lightSpecular, lightPosition;

vec4 light(vec3 N, vec3 V, vec3 L)
{
    vec3 R = normalize(2.0*dot(N,L)*N-L);
    float RdotV = max(0.0,dot(R,V));
    float Idiff = max(0.0,dot(N,L));
    
    float Ispec = 0;
    if (Idiff > 0) Ispec=pow(RdotV,matShininess);
    
    return matAmbient*lightAmbient + matDiffuse*lightDiffuse*Idiff + matSpecular*lightSpecular*Ispec;
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 V = normalize((modelViewMatrix * vec4(vertex, 1.0)).xyz);
    vec3 L = normalize(lightPosition.xyz - V);
    
    frontColor = light(N,-V,L);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
