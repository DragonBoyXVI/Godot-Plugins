shader_type canvas_item;

uniform float distort_strength: hint_range(0.0, 1.0, 0.01) = 0.05;
uniform vec2 distort_scroll = vec2( 0.125 );
uniform ivec2 distort_tile = ivec2( 1 );
uniform float distort_rotate_speed = 0.0;
uniform sampler2D distortion_map;
uniform vec2 base_scroll = vec2( 0.05 );
uniform float base_rotate_speed = 0.0;
uniform ivec2 base_tile = ivec2( 1 );

varying vec4 modulate;

void vertex() {
	modulate = COLOR;
}

void fragment() {
	// bear with me here qwqq
	float time_distrt = TIME * distort_rotate_speed;
	mat2 distort_matrix = mat2( 
		vec2( cos( time_distrt ), -sin( time_distrt ) ),
		vec2( sin( time_distrt ), cos( time_distrt ) )
	 );
	
	vec2 distort_sample_uv = fract( ( ( UV * vec2( distort_tile ) ) + ( distort_scroll * TIME ) ) * distort_matrix );
	vec4 distort_sample = texture( distortion_map, distort_sample_uv );
	vec2 distort_uv = distort_sample.xy - vec2( 0.5 );
	distort_uv *= distort_strength;
	vec2 final_uv = fract( ( UV * vec2( base_tile ) ) + distort_uv + ( base_scroll * TIME ) );
	
	COLOR = texture( TEXTURE, final_uv ) * modulate;
}
