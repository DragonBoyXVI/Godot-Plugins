@abstract
@tool
extends Area2D;
class_name StrippedArea2DGD;
## An [Area2D] with some properties disabled, so that they can be enabled
## in code instead.
##
## NOTE: Disabled properties are set to whatever is its OFF state,
## so you have to explicitly turn them back on.
## NOTE: Call super() in _init()!!!


func _init() -> void:
	
	monitoring = false;
	monitorable = false;
	collision_layer = 0;
	collision_mask = 0;
	input_pickable = false;

func _validate_property( property: Dictionary ) -> void:
	const DISABLED: PackedStringArray = [
		^"monitoring",
		^"monitorable",
		^"collision_layer",
		^"collision_mask",
		^"input_pickable",
	];
	
	if ( DISABLED.has( property[ XVIUtility.Property.NAME ] ) ):
		property[ XVIUtility.Property.USAGE ] = PROPERTY_USAGE_NONE;
