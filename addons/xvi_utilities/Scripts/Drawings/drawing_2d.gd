@abstract
@tool
extends Node2D
class_name Drawing2D
## Base class for drawing shapes
##
## Provides some useful automations fro drawing, such as managing
## and providng a rid to draw to.


const FLAG_DRAW_OUTLINE = 1<<0
const FLAG_DRAW_CENTER = 1<<1
const FLAG_DEFAULTS = FLAG_DRAW_CENTER | FLAG_DRAW_OUTLINE


## How many pixels thick the outline is
@export var outline_thickness: float = 3.0:
	set( new ):
		
		outline_thickness = maxf( 1.0, new )
		queue_redraw()
## color of the outline
@export var outline_color: Color = Color.BLACK:
	set( new ):
		
		outline_color = new
		queue_redraw()
## Color of the shape center
@export var center_color: Color = Color.WHITE:
	set( new ):
		
		center_color = new
		queue_redraw()
## Flags for what to draw.
@export_flags( "Draw Outline", "Draw Center" ) var draw_flags: int = FLAG_DEFAULTS:
	set( new ):
		
		draw_flags = new
		queue_redraw()

### [RID] for the canvas item we draw to.
## is automatically managed by this node.
var drawing_rid: RID


func _enter_tree() -> void:
	
	drawing_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent( drawing_rid, get_canvas_item() )
	RenderingServer.canvas_item_set_use_parent_material( drawing_rid, true )

func _exit_tree() -> void:
	
	RenderingServer.free_rid( drawing_rid )
