@tool
extends Sprite2D


func _validate_property(property: Dictionary) -> void:
	if ( property[ "name" ] == "region_enabled" ):
		print( property );
