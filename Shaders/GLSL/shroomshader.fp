vec3 hsv_to_rgb(float _hue)
{
	vec3 value = vec3(1.0, 1.0, 1.0);
	
	float hue = abs(_hue);
	float h = float((int(hue) % 360) / 60);
	
	float v = 1.0;
	float s = 1.0;
	
	if (h < 1)
	{
		value.x = v;
		value.y = v * (1 - s * (1 - hue));
		value.z = v * (1 - s);
	}
	else if (h < 2)
	{
		value.x = v * (1 - s * (hue - 1));
		value.y = v;
		value.z = v * (1 - s);
	}
	else if (h < 3)
	{
		value.x = v * (1 - s);
		value.y = v;
		value.z = v * (1 - s * (3 - hue));
	}
	else if (h < 4)
	{
		value.x = v * (1 - s);
		value.y = v * (1 - s * (hue - 3));
		value.z = v;
	}
	else if (h < 5)
	{
		value.x = v * (1 - s * (5 - hue));
		value.y = v * (1 - s);
		value.z = v;
	}
	else
	{
		value.x = v;
		value.y = v * (1 - s);
		value.z = v * (1 - s * (hue - 5));
	}
	
	return value;
}

void main()
{
	float h = 0.001;
    
	vec4 n = texture(InputTexture, (TexCoord + vec2( 0, h)));
    vec4 e = texture(InputTexture, (TexCoord + vec2( h, 0)));
    vec4 s = texture(InputTexture, (TexCoord + vec2( 0,-h)));
    vec4 w = texture(InputTexture, (TexCoord + vec2(-h, 0)));

	vec4 dy = (n - s)*.5;
    vec4 dx = (e - w)*.5;
    
    vec4 edge = sqrt(dx*dx + dy*dy);
	float dist = distance(vec3(0., 0., 0.), edge.xyz);
	
	if (dist >= 0.09)
	{
		float offseta = 360 * (cos(iTime * 0.01) + 1.0) / 2;
		float offsetb = 360 * dist * 10 * sin(iTime * 0.001);
		FragColor.xyz = hsv_to_rgb(offseta + offsetb);
		return;
	}
	
	vec4 pic = texture(InputTexture, TexCoord);
	float avg = (pic.x + pic.y + pic.z) / 3;
	
	FragColor.xyz = vec3(avg);
}