shader_type canvas_item;

uniform float distort_strength: hint_range(0.0, 1.0, 0.01) = 0.05;
uniform vec2 distort_scroll = vec2( 0.125 );
uniform sampler2D distortion_map: filter_nearest;
uniform vec2 base_scroll = vec2( 0.05 );

varying vec4 modulate;

void vertex() {
	modulate = COLOR;
}

void fragment() {
	vec4 distort_sample = texture( distortion_map, fract( UV + ( distort_scroll * TIME ) ) );
	vec2 distort_uv = distort_sample.xy - vec2( 0.5 );
	distort_uv *= distort_strength;
	vec2 final_uv = fract( UV + distort_uv + ( base_scroll * TIME ) );
	
	COLOR = texture( TEXTURE, final_uv ) * modulate;
}
