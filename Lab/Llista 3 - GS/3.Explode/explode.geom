#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

const float speed = 0.5;
const float angSpeed = 8.0;

vec4 explode(vec4 position) {
    vec3 direction = speed*time*(vnormal[0]+vnormal[1]+vnormal[2])/3;
    return position + vec4(direction,0);
}
   

void main( void )
{
   
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix* explode(gl_in[i].gl_Position);
		EmitVertex();
	}
    EndPrimitive();
}

