#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;

uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;
uniform float time;
uniform bool eyespace = true;

void main()
{
    frontColor = vec4(color,1.0);
    
    float r = distance(boundingBoxMin, boundingBoxMax)/2.0;
    float y = vertex.y;
    if (eyespace) y = (modelViewMatrix*vec4(vertex,1.0)).y;
    
    float d = (r/10.0)*y;
    d = d*sin(time);
    vec4 animateVertex = vec4(normal*d + vertex.xyz, 1.0);
    
    gl_Position = modelViewProjectionMatrix * animateVertex;
}
