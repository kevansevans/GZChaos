void main()
{
	vec3 color = texture(InputTexture, TexCoord).xyz;
	
	FragColor = vec4(1.0 - color.x, 1.0 - color.y, 1.0 - color.z, 1.0);
}