shader_type canvas_item;
// Based on this shader by Benmo
// https://godotshaders.com/shader/hue-shift/

uniform float hue_shift_amt: hint_range( 0.0, 1.0 ) = 0.0;

varying vec4 modulate;

vec4 shift_hue( in vec4 color, in float shift ) {
	// gray in RGB color space
	const vec3 gray = vec3( 0.57735 );
	// project the color onto the gray axis
	vec3 projection = gray * dot( gray, color.rgb );
	// vector from gray axis to og color
	vec3 U = color.rgb - projection;
	// vector prependicular to gray and u
	vec3 V = cross( gray, U );
	// rotate U and V around the gray axis
	float hue = shift * 2.0 * PI;
	vec3 shifted = U * cos( hue ) + V * sin( hue ) + projection;
	return vec4( shifted, color.a );
}


void vertex() {
	modulate = COLOR;
}

void fragment() {
	COLOR = shift_hue( texture( TEXTURE, UV ), hue_shift_amt ) * modulate;
}
