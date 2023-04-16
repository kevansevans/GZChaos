//https://www.shadertoy.com/view/ll3BzX

#define PI 3.14159265358979323846264338327950288419716939937510

void main()
{
    vec2 uv = TexCoord;

    float scale = PI;
	float timescale = (float(iTime) / 100.);
    uv += vec2(sin(timescale + uv.y * scale),cos(timescale + uv.x * scale)) * 0.1;
    vec4 col = texture(InputTexture, uv);

    FragColor = col;
}