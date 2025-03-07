#version 410

uniform vec3 u_colour;		// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main()
{
	vec2 p = gl_FragCoord.xy / u_screenSize;   // scale p into range (0,0) to (1,1)
	
	// Circle
	// float d = distance(p, vec2(0.5, 0.5));     // calculate distance to midpoint 	
  
  	// Square
	// vec2 v = abs(p - vec2(0.5, 0.5)); // center it onto (0,0) and then kind of folds upon itself
	// float d = max(v.x, v.y); // Bigger one is chosen which means it becomes a square   

	// Diamond
	vec2 v = abs(p - vec2(0.5, 0.5));
	float d = abs(v.x + v.y);

   	if(d < 0.3)
   	{
   		o_colour = vec4(u_colour, 1);
   	}
	else
	{
		o_colour = vec4(0,0.3,1,1); // BLUE
	}
	/*if(0.5 > distance(p, vec2(0, 0)))
	{
		
		o_colour =  vec4(u_colour, 1);
	}*/
}