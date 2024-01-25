vec3[7] penColors() {
 	vec3 colors[7];
	
	colors[0] = vec3(00., 54., 111.) / 255.;
	colors[1] = vec3(00., 00., 128.) / 255.;
	colors[2] = vec3(00., 43., 100.) / 255.;
	colors[3] = vec3(00., 43., 89.) / 255.;
	colors[4] = vec3(09., 43., 80.) / 255.;
	colors[5] = vec3(00., 34., 71.) / 255.;
	colors[6] = vec3(25., 25., 112.) / 255.;
	
    return colors;
}

vec3 getClosest(vec3 colorinput)
{
	int i_best = 0;
	float f_best = 2.0;
	
	vec3 colors[7] = penColors();
	
	for (int i = 0; i < 7; ++i)
	{
		float dist = distance(colors[i], colorinput);
		if (dist < f_best)
		{
			f_best = dist;
			i_best = i;
		}
	}
	
	return colors[i_best];
}

void main()
{
	float h = 0.001;
    
    vec4 o = texture(InputTexture, (TexCoord + vec2( 0, 0)));
	vec4 n = texture(InputTexture, (TexCoord + vec2( 0, h)));
    vec4 e = texture(InputTexture, (TexCoord + vec2( h, 0)));
    vec4 s = texture(InputTexture, (TexCoord + vec2( 0,-h)));
    vec4 w = texture(InputTexture, (TexCoord + vec2(-h, 0)));
	
	o = vec4(getClosest(o.xyz), 1.0);
	n = vec4(getClosest(n.xyz), 1.0);
	e = vec4(getClosest(e.xyz), 1.0);
	s = vec4(getClosest(s.xyz), 1.0);
	w = vec4(getClosest(w.xyz), 1.0);

	vec4 dy = (n - s)*.5;
    vec4 dx = (e - w)*.5;
    
    vec4 edge = sqrt(dx*dx + dy*dy);
	
	if (distance(vec3(0., 0., 0.), edge.xyz * 5.0) >= 0.1)
	{
		FragColor.xyz = edge.xyz * 5.0;
		return;
	}
}