shader_type canvas_item;

uniform float speed = 1.0;
uniform float time_offset = 0.0;

group_uniforms Rotate;
uniform float rotate_speed = 0.0;
uniform float rotate_offset = 0.0;

group_uniforms Wave;
uniform float wave_speed = 1.0;
uniform float wave_offset = 0.0;
uniform vec2 wave_amplitude = vec2( 0.0 );
uniform float wave_offset_per_vertex = 5.0;

group_uniforms Pulse;
uniform float pulse_speed = 1.0;
uniform float pulse_offset = 0.0;
uniform vec2 pulse_amplitude = vec2( 0.0 );

void vertex() {
	float time = ( TIME + time_offset ) * speed;
	
	//rotate
	float rotate_time = ( time + rotate_offset ) * rotate_speed;
	mat2 rotation_matrix = mat2(
		vec2( cos( rotate_time ), -sin( rotate_time ) ),
		vec2( sin( rotate_time ), cos( rotate_time ) ) );
	VERTEX.xy *= rotation_matrix;
	
	//wave
	float wave_time = ( ( time + wave_offset ) + ( float( VERTEX_ID ) * wave_offset_per_vertex ) ) * wave_speed;
	VERTEX.xy += vec2( sin( wave_time ), cos( wave_time ) ) * wave_amplitude;
	
	//pulse
	float pulse_time = ( time + pulse_offset ) * pulse_speed;
	vec2 pulse_vector = vec2( 1.0 );
	pulse_vector.xy += sin( pulse_time ) * pulse_amplitude;
	VERTEX.xy *= pulse_vector;
}
