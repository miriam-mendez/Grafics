#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform float speed = 0.5;
uniform float time;

uniform mat4 modelViewProjectionMatrix;
const float pi = 3.141592;

void main( void )
{
    if (0 <= time && time < 1.0/speed) {
        if (mod(gl_PrimitiveIDIn,2) == 0) {
            for( int i = 0 ; i < 3 ; i++ )
	        {
		        gfrontColor = vfrontColor[i];
		        gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		        EmitVertex();
	        }
            EndPrimitive();
        }
    }
    
    if (1.0/speed <= time && time < 2.0/speed) {
        if (mod(gl_PrimitiveIDIn,2) != 0) {
            for( int i = 0 ; i < 3 ; i++ )
	        {
		        gfrontColor = vfrontColor[i];
		        gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		        EmitVertex();
	        }
            EndPrimitive();
        }
    }
    else {
        vec4 BC = (gl_in[0].gl_Position + gl_in[1].gl_Position + gl_in[2].gl_Position)/3; 
        for( int i = 0 ; i < 3 ; i++ ) {
	        gfrontColor = vfrontColor[i];
	        gl_Position = modelViewProjectionMatrix*abs(gl_in[i].gl_Position - BC)* sin(2 * pi * fract(time*speed));
	        EmitVertex();
        }
        EndPrimitive();
	}
}
