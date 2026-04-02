extends Node2D



func _test():
	pass


func _input( event: InputEvent ) -> void:
	if ( event is InputEventKey ):
		if ( not event.is_pressed() ): return;
		if ( event.is_echo() ): return;
		if ( event.keycode != KEY_SPACE ): return;
		pass;
