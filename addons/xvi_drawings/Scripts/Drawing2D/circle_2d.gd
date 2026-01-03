@tool
extends Drawing2D
class_name Circle2D
## Draws a circle
##
## Actually draws two circles since no hollow circle exists lol


## Radius of the circle.
## not affected by outline thickness.
@export var radius: float = 32.0:
	set( new ):
		
		radius = maxf( 1.0, new )
		queue_redraw()
## offset from the center of the circle
@export var offset: Vector2 = Vector2.ZERO:
	set( new ):
		
		offset = new
		queue_redraw()


func _draw() -> void:
	
	RenderingServer.canvas_item_clear( drawing_rid )
	
	if ( draw_flags == 0 ):
		return
	
	if ( draw_flags & FLAG_DRAW_OUTLINE ):
		RenderingServer.canvas_item_add_circle( drawing_rid, offset, radius + outline_thickness, outline_color )
	
	if ( draw_flags & FLAG_DRAW_CENTER ):
		RenderingServer.canvas_item_add_circle( drawing_rid, offset, radius, center_color )
