#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform bool classic = false;
const float pi = 3.141592;

void main()
{
    vec2 C = vec2(0.5,0.5);
    float R = 0.2;
    float d = distance(vtexCoord, C);
    
    fragColor = vec4(1.0,vec2(step(R,d)),1.0);
    if(!classic) {
        vec2 u = vtexCoord - C;
        float a = atan(u.t,u.s);
        float m = mod(a/(pi/16) + 0.5,2);
        if (m < 1) fragColor = vec4(1.0,0.0,0.0,1.0);
        
    }
}
