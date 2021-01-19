#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	gfrontColor = vec4(0);
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
	EmitVertex();
	
    EndPrimitive();
}
