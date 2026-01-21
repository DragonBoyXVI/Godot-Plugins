@tool
extends Circle2D
class_name PerfectPolygon2D
## Draws a multi point polygon, like pentagons.
##
## increase the points enough and you loop back around to a shitty circle lol


## How many points the polygon has
@export var points: int = 5:
	set( new ):
		
		points = maxi( 3, new )
		queue_redraw()


func _draw() -> void:
	
	RenderingServer.canvas_item_clear( drawing_rid )
	
	var point_array: PackedVector2Array = []
	point_array.resize( points )
	for i: int in points:
		var angle: float = ( float( i ) / points ) * TAU
		var vector := Vector2.from_angle( angle )
		vector *= radius
		point_array[ i ] = vector
	
	if ( draw_flags & FLAG_DRAW_CENTER ):
		RenderingServer.canvas_item_add_polygon( drawing_rid, point_array, [center_color] )
	
	if ( draw_flags & FLAG_DRAW_OUTLINE ):
		
		var line_points := PackedVector2Array( point_array )
		line_points.append( line_points[ 0 ] )
		
		RenderingServer.canvas_item_add_polyline( drawing_rid, line_points, [outline_color], outline_thickness, false )
