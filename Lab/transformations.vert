#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

mat4 translate(float tx, float ty, float tz) {
    return mat4 (   vec4(1.0, 0.0, 0.0, 0.0),
                    vec4(0.0, 1.0, 0.0, 0.0),
                    vec4(0.0, 0.0, 1.0, 0.0),
                    vec4(tx, ty, tz, 1.0));
}

mat4 scale(float sx, float sy, float sz) {
    return mat4 (   vec4(sx, 0.0, 0.0, 0.0),
                    vec4(0.0, sy, 0.0, 0.0),
                    vec4(0.0, 0.0, sz, 0.0),
                    vec4(0.0, 0.0, 0.0, 1.0));
}

mat4 rotate(float a, float x, float y, float z) {
    float d = 1-cos(a);
    float c = cos(a);
    float s = sin(a);
    
    return mat4 (   vec4(pow(x,2)*d+c, y*x*d + z*s, x*z*d - y*s, 0.0),
                    vec4(x*y*d - z*s, pow(y,2)*d+c, y*z*d + x*s, 0.0),
                    vec4(x*z*d + y*s, y*z*d - x*s, pow(z,2)*d + c,0.0),
                    vec4(0.0, 0.0, 0.0, 1.0));
}

mat3 rotateX(float a) {
    return mat3 (   vec3(1.0,0.0,0.0),
                    vec3(0.0, cos(a), sin(a)),
                    vec3(0.0, -sin(a), cos(a)));
}

mat3 rotateY(float a) {
    return mat3 (   vec3(cos(a), 0.0, -sin(a)),
                    vec3(0.0, 1.0, 0.0),
                    vec3(sin(a), 0.0, cos(a)));
}

mat3 rotateZ(float a) {
    return mat3 (   vec3(cos(a), sin(a), 0.0),
                    vec3(-sin(a), cos(a), 0.0),
                    vec3(0.0, 0.0, 1.0));
}

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
