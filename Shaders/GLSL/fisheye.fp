void main()
{
	vec2 p = TexCoord.xy;
	
	float prop = iResolution.x / iResolution.y;
	vec2 m = vec2(0.5, 0.5 / prop);
	vec2 d = p - m;
	float r = sqrt(dot(d, d));
	
	float power = ( 2.0 * 3.141592 / (2.0 * sqrt(dot(m, m))) ) *
				(0.1);//amount of effect

	float bind = sqrt(dot(m, m));
		
	vec2 uv;
	
	uv = m + normalize(d) * tan(r * power) * bind / tan( bind * power);

	vec3 col = texture(InputTexture, vec2(uv.x, -uv.y * prop)).xyz;
	FragColor = vec4(col, 1.0);
}