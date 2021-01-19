#version 330 core

out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
    vec2 C = vec2(0.5,0.5);
    float R = 0.2;
    float d = distance(C, vtexCoord);
    
    fragColor = vec4(step(R, d));
    if (fragColor != vec4(1)) fragColor = vec4(1.0,0.0,0.0,1.0); 
}
