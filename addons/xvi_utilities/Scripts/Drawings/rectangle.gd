@tool
extends Drawing2D
class_name Rectangle2D
## draws a rectangle to the screen.
##
## Simple rectiod, sqare even...


## Size of the rectangle
@export var size: Vector2 = Vector2( 32.0, 32.0 ):
	set( new ):
		
		size = new.max( Vector2.ONE )
		queue_redraw()
## rectagle offset.
## If from_center is true, this is from the center,
## else its from the top left corner.
@export var offset: Vector2 = Vector2.ZERO:
	set( new ):
		
		offset = new
		queue_redraw()
## if turned off, the rectangle is drawn from the top left corner.
@export var from_center: bool = true:
	set( new ):
		
		from_center = new
		queue_redraw()


func _draw() -> void:
	
	RenderingServer.canvas_item_clear( drawing_rid )
	
	var rect := Rect2( offset, size )
	if ( from_center ):
		rect.position -= size * 0.5
	
	if ( draw_flags & FLAG_DRAW_CENTER ):
		RenderingServer.canvas_item_add_rect( drawing_rid, rect, center_color, false )
	
	if ( draw_flags & FLAG_DRAW_OUTLINE ):
		
		var points := PackedVector2Array()
		points.resize( 5 )
		# top left
		points[ 0 ] = Vector2( rect.position )
		# top right
		points[ 1 ] = Vector2( rect.position + ( rect.size * Vector2( 1, 0 ) ) )
		# bottom right
		points[ 2 ] = Vector2( rect.position + rect.size )
		# bottom left
		points[ 3 ] = Vector2( rect.position + ( rect.size * Vector2( 0, 1 ) ) )
		# close the loop
		points[ 4 ] = points[ 0 ]
		
		RenderingServer.canvas_item_add_polyline( drawing_rid, points, [outline_color], outline_thickness, false )
