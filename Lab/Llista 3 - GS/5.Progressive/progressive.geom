#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main( void )
{
    if (gl_PrimitiveIDIn < 100*time) {
	    for( int i = 0 ; i < 3 ; i++ )
	    {
		    gfrontColor = vfrontColor[i];
		    gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		    EmitVertex();
	    }
        EndPrimitive();
    }
}
