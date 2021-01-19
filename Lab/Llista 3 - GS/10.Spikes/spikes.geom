#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 9) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;

uniform float disp = 0.05;
uniform mat4 modelViewProjectionMatrix;

void makeFace(int a, int b, vec3 C) {
    gfrontColor = vfrontColor[a];
	gl_Position = modelViewProjectionMatrix*gl_in[a].gl_Position; EmitVertex();
	gfrontColor = vec4(1);
	gl_Position = modelViewProjectionMatrix*vec4(C,1); EmitVertex();
	gfrontColor = vfrontColor[b];
	gl_Position = modelViewProjectionMatrix*gl_in[b].gl_Position; EmitVertex();
	EndPrimitive();
}

void main( void )
{
    vec4 C = (gl_in[0].gl_Position+gl_in[1].gl_Position+gl_in[2].gl_Position)/3;
	vec3 N = (vnormal[0]+vnormal[1]+vnormal[2])/3;
	makeFace(0, 1, C.xyz+N*disp);
	makeFace(1, 2, C.xyz+N*disp);
	makeFace(2, 0, C.xyz+N*disp);
	
}
