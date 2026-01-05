shader_type canvas_item;

uniform float speed = 1.0;
uniform float time_offset = 0.0;

void vertex() {
	float delta = ( TIME + time_offset ) * speed;
	mat2 rotation_matrix = mat2(
		vec2( cos( delta ), -sin( delta ) ),
		vec2( sin( delta ), cos( delta ) ) );

	VERTEX.xy *= rotation_matrix;
}
