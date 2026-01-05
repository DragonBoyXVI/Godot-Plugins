shader_type canvas_item;
// moves all the vertexes around. can be cool ig.

uniform float speed = 1.0;
// distance vertexes travel from origin.
uniform vec2 amplitude = vec2( 16.0 );
// offset per vertex in seconds. a lower values makes vertex movement more uniform.
uniform float vertex_offset = 5.0;
uniform float time_offset = 0.0;

void vertex() {
	float time = ( ( TIME + time_offset ) + ( vertex_offset * float( VERTEX_ID ) ) ) * speed;
	
	VERTEX.x += sin( time ) * amplitude.x;
	VERTEX.y += cos( time ) * amplitude.y;
}
