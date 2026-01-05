shader_type canvas_item;

uniform float speed = 1.0;
uniform vec2 amplitude = vec2( 0.25 );
uniform bool sync_xy = true;
uniform float time_offset = 0.0;


void vertex() {
	float time = ( TIME + time_offset ) * speed;
	vec2 pulse_vector = vec2( 1.0 );
	pulse_vector.x += sin( time ) * amplitude.x;
	pulse_vector.y += ( sync_xy ? sin( time ) : -sin( time ) ) * amplitude.y;

	VERTEX.xy *= pulse_vector;
}
