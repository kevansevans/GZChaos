void main()
{
	vec2 localCord = floor(TexCoord * inputScale);
	localCord = localCord / inputScale;
	
	FragColor = vec4(	textureGather(InputTexture, localCord, 0).x,
						textureGather(InputTexture, localCord, 1).x,
						textureGather(InputTexture, localCord, 2).x,
						textureGather(InputTexture, localCord, 3).x);
}