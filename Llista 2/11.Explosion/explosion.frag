#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;
uniform sampler2D explosion;

uniform float time;
uniform float slice = 1/30.0;//cada frame es mostra durant 1/30 segons

void main()
{   
    vec2 texCoord = vec2(1/8.0, 1/6.0)*vtexCoord; //s= [0,1/8] i t = [0,1/6]
    texCoord.t += (1 - 1/6.0); //s = [0,1/8] i t = [5/6,1] (la posició inicial)
    
    int frame = int(mod(time/slice,48));//cada 1/30s ++frame
    int x = int(mod(frame,8)); 
    int y = frame/8; //quan hagi fet 8, sumem una fila
    
    texCoord.s += x*1/8.0; //offset coord s
    texCoord.t -= y*1/6.0; //offset coord t
    
    fragColor = texture(explosion,texCoord);
    fragColor *= fragColor.a;
    
}
