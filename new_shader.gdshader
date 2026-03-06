shader_type canvas_item;


uniform vec3 tint_color: source_color = vec3( 1.0 );
uniform float tint_strength: hint_range(0.0, 1.0, 0.01) = 1.0;


varying vec4 modulate;


void vertex() {
	modulate = COLOR;
}

void fragment() {
	vec4 base_color = texture( TEXTURE, UV );
	const float div = 1.0/3.0;
	float base_strength = ( base_color.r + base_color.g + base_color.b ) * div;
	
	float strength = min( base_strength, tint_strength );
	COLOR = vec4( mix( base_color.rgb, tint_color, strength ), base_color.a ) * modulate;
}
