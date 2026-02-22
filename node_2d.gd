extends Node2D


@export var elem1: ElementGD;
@export var elem2: ElementGD;


func _test():
	pass


func _input( event: InputEvent ) -> void:
	if ( event is InputEventKey ):
		if ( not event.is_pressed() ): return;
		if ( event.is_echo() ): return;
		if ( event.keycode != KEY_SPACE ): return;
		if ( not elem1 or not elem2 ): return;
		print( "Element 1: ", elem1.current_element );
		print( "strength to Element 2: ", elem1.get_strength_against( elem2 ) );
		print( "Element 2: ", elem2.current_element );
		print( "Strength to Element 1: ", elem2.get_strength_against( elem1 ) );
