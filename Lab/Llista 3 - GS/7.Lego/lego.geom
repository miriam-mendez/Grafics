#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec2 vtexCoord[];

out vec4 gfrontColor;
out vec2 gtexCoord;
out vec3 gnormal;
out float top;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float step = 0.25;

float light(vec3 a, vec3 b, vec3 c) {
    return normalize(normalMatrix*cross(b-a,c-a)).z;
    
}

void topface(vec3 a, vec3 b, vec3 c, vec3 d) {
    top = 1;
    gfrontColor = vfrontColor[0]*light(a,b,c);
    gtexCoord = vec2(0,0);
    gl_Position = modelViewProjectionMatrix*vec4(a,1); EmitVertex();
    gtexCoord = vec2(1,0);
    gl_Position = modelViewProjectionMatrix*vec4(b,1); EmitVertex();
    gtexCoord = vec2(0,1);
    gl_Position = modelViewProjectionMatrix*vec4(c,1); EmitVertex();
    gtexCoord = vec2(1,1);
    gl_Position = modelViewProjectionMatrix*vec4(d,1); EmitVertex();
    EndPrimitive();
}
void makeface(vec3 a, vec3 b, vec3 c, vec3 d) {
    top = 0;
    gfrontColor = vfrontColor[0]*light(a,b,c);
    gl_Position = modelViewProjectionMatrix*vec4(a,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix*vec4(b,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix*vec4(c,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix*vec4(d,1); EmitVertex();
    EndPrimitive();
}

vec3 traslate(float a, float b, float c) {
    vec4 C = (gl_in[0].gl_Position+gl_in[1].gl_Position+gl_in[2].gl_Position) / 3.0;
    C = round(C/step)*step ;
    return vec3(C) + vec3(a,b,c);
}

void main( void )
{       
        float R = step/2;
        makeface(traslate(R,R,R), traslate(-R,R,R), traslate(R,-R,R), traslate(-R,-R,R)); // front face
        makeface(traslate(R,R,-R), traslate(R,-R,-R), traslate(-R,R,-R), traslate(-R,-R,-R)); // back face
        makeface(traslate(-R,R,R), traslate(-R,R,-R), traslate(-R,-R,R), traslate(-R,-R,-R)); // left face 
        makeface(traslate(R,R,R), traslate(R,-R,R), traslate(R,R,-R), traslate(R,-R,-R)); // right face
        makeface(traslate(-R,-R,R), traslate(-R,-R,-R), traslate(R,-R,R), traslate(R,-R,-R)); // bottom face
        topface(traslate(-R,R,R), traslate(R,R,R), traslate(-R,R,-R), traslate(R,R,-R)); // top face
        
        
}
