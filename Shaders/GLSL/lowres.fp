float size = 128.;

void main()
{
	vec2 iRes = vec2(320, 200);
	vec2 resolution = vec2(size, iResolution.y / iResolution.x * size);
	vec2 localCord = floor(TexCoord * iRes);
    vec2 uv = localCord / iRes;
	
	FragColor = vec4(texture(InputTexture, uv).xyz,1.0);
}