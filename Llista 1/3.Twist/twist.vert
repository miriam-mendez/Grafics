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
    frontColor = vec4(color,1.0);
    
    float x = 0.4*vertex.y*sin(time);
    mat3 RotateY = mat3 (   vec3(cos(x),0.0,-sin(x)),
                            vec3(0.0,1.0,0.0),
                            vec3(sin(x),0.0,cos(x)));
             
    vec4 vertexRotate = vec4 (RotateY*vertex,1.0);
    gl_Position = modelViewProjectionMatrix * vertexRotate;
}
