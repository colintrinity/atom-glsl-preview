uniform vec2 iResolution;
uniform vec2 iMouse;
uniform float iGlobalTime;

float map(float value, float inMin, float inMax, float outMin, float outMax) {
	return outMin + (outMax - outMin) * (value - inMin) / (inMax - inMin);
}

void main() {

	vec2 uv = gl_FragCoord.xy/iResolution.xy;
	float aspect = iResolution.x / iResolution.y;

	uv.x *= aspect;

	vec3 color = vec3(uv.x,uv.y,0.0);

	vec2 mouse = vec2(iMouse.xy);
	mouse.x *= aspect;

	float radius = map(sin(iGlobalTime), -1.0, 1.0, 0.25, 0.5);

	if(distance(uv.xy, mouse) < radius){
	 	color.x = 2.0 - color.x;
	 	color.y = 2.0 - color.y;
	}

	gl_FragColor=vec4(color,1.0);
}