#version 330 core

layout (location = 0) in vec3 vertex; //object space
layout (location = 1) in vec3 normal; //object sapce
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform float freq = 1; //expressada en Hz
uniform float amplitude = 0.1;

const float PI = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix*normal); //normal en eye space(coord camara)
    frontColor = vec4(vec3(N.z),1); 
    
    float d = amplitude*sin(2*PI*freq*time); //distancia per moure els vertexs
    vec3 animateVertex = d*normal + vertex;//moure vertexs en la direccio de la seva normal
    
    gl_Position = modelViewProjectionMatrix * vec4(animateVertex, 1.0);//clip space
}
