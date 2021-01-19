#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
in vec3 gnormal;
in vec3 gPos;

uniform float d = 0.1;
uniform sampler2D grass_top, grass_side;
 
void main()
{
    if (gnormal.z == 0) fragColor = texture(grass_side, vec2(4*(gPos.x - gPos.y), 1.0 - gPos.z/d));
    else fragColor = texture(grass_top, 4*gPos.xy);
    
}
