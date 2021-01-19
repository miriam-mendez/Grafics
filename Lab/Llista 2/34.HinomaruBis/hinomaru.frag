#version 330 core

out vec4 fragColor;
in vec2 vtexCoord;

float aastep(float treshold, float x)
{
    float width = 0.7*length(vec2(dFdx(x),dFdy(x)));
    return smoothstep(treshold-width, treshold+width,x);
}

void main()
{
    vec2 C = vec2(0.5,0.5);
    float R = 0.2;
    float d = distance(C, vtexCoord);
    
    fragColor = vec4(aastep(R, d));
    if (fragColor != vec4(1)) fragColor = vec4(1.0,0.0,0.0,1.0); 
}
