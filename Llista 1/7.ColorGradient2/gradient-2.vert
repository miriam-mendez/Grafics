#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

const vec4 colors[5] = vec4[5] (
                        vec4(1.0,0.0,0.0,1.0), //red
                        vec4(1.0,1.0,0.0,1.0), //yellow
                        vec4(0.0,1.0,0.0,1.0), //green
                        vec4(0.0,1.0,1.0,1.0), //cian
                        vec4(0.0,0.0,1.0,1.0));//blue
                        
void main()
{
    vec3 N = normalize(normalMatrix * normal);
    
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    vec3 vertexNDC = gl_Position.xyz/gl_Position.w;
    
    float position = (vertexNDC.y + 1.0)/0.5;
    int i = int(position);
    frontColor = mix(colors[i],colors[i+1],fract(position));
    
}
