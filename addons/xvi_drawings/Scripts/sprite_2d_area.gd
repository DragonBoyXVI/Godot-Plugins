@tool
extends Sprite2D
#class_name Sprite2DArea
## A [Sprite2D] class better suited for covering a specific area.
##
## 


@export var area: Vector2 = Vector2.ONE:
	set( new ):
		area = new.abs().max( Vector2.ONE )
		_area_changed()


func _validate_property( property: Dictionary ) -> void:
	if ( property[ "name" ] == "scale" ):
		property[ "usage" ] = PROPERTY_USAGE_NONE

func _ready() -> void:
	
	texture_changed.connect( _on_texture_changed )


func _area_changed() -> void:
	
	if ( not texture ):
		return
	
	var tex_size := texture.get_size()
	scale = Vector2( ( area.x / tex_size.x ),
	( area.y / tex_size.y ) )
	print( scale )


func _on_texture_changed() -> void:
	_area_changed()
