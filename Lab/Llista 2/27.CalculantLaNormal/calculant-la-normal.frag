#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 vvertex;

void main()
{
    vec3 J = dFdx(vvertex);
    vec3 K = dFdy(vvertex);
    
    vec3 N = normalize(cross(J,K));
    fragColor = frontColor*N.z;
}
