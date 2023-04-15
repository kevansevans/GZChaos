//https://www.shadertoy.com/view/Xltfzj

void main()
{
    float Pi = 6.28318530718;
    float Directions = 16.0;
    float Quality = 3.0;
    float Size = 16.0;
   
    vec2 Radius = Size/iResolution.xy;
    vec4 Color = texture(InputTexture, TexCoord);
    
    for( float d=0.0; d<Pi; d+=Pi/Directions)
    {
		for(float i=1.0/Quality; i<=1.0; i+=1.0/Quality)
        {
			Color += texture(InputTexture, TexCoord + vec2(cos(d), sin(d)) *Radius*i);		
        }
    }
    
    Color /= Quality * Directions - 15.0;
    FragColor =  Color;
}