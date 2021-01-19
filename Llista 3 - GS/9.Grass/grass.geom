#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 vnormal[];
out vec3 gnormal;
out vec3 gPos;

uniform float d = 0.1;
uniform mat4 modelViewProjectionMatrix;

vec3 getNormal(vec3 a, vec3 b, vec3 c) {
	 return normalize(cross(b-a,c-a));
}

void makeBase1(vec3 N) {
    gnormal = vec3(-N);
    for( int i = 0 ; i < 3 ; i++ ) {
        gPos = gl_in[i].gl_Position.xyz;
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}

void makeLateral(vec3 a, vec3 b, vec3 c, vec3 d) {
    gnormal = getNormal(a.xyz,b.xyz,c.xyz);
    
    gPos = a;
    gl_Position = modelViewProjectionMatrix*vec4(a,1); EmitVertex();
    
    gPos = b;
    gl_Position = modelViewProjectionMatrix*vec4(b,1); EmitVertex();
    
    gPos = c;
    gl_Position = modelViewProjectionMatrix*vec4(c,1); EmitVertex();
    
    gPos = d;
    gl_Position = modelViewProjectionMatrix*vec4(d,1); EmitVertex();
    EndPrimitive();
}

void main( void )
{
if (gl_PrimitiveIDIn == 0)  {
    vec3 N = normalize((normalize(vnormal[0])+normalize(vnormal[1])+normalize(vnormal[2]))/3);
    makeBase1(N);
	
	// V0 -> V1 -> D0 -> D1
	makeLateral(gl_in[0].gl_Position.xyz, gl_in[1].gl_Position.xyz, gl_in[0].gl_Position.xyz+vec3(d*N), gl_in[1].gl_Position.xyz+vec3(d*N));
	
	// V1 -> V2 -> D1 -> D2
	makeLateral(gl_in[1].gl_Position.xyz, gl_in[2].gl_Position.xyz, gl_in[1].gl_Position.xyz+vec3(d*N), gl_in[2].gl_Position.xyz+vec3(d*N));
	
	// V2 -> V0 -> D2 -> D0
	makeLateral(gl_in[2].gl_Position.xyz, gl_in[0].gl_Position.xyz, gl_in[2].gl_Position.xyz+vec3(d*N), gl_in[0].gl_Position.xyz+vec3(d*N));
	
	}
}
