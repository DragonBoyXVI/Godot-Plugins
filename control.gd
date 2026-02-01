extends Control

func _ready() -> void:
	
	( $Button as Button ).pressed.connect( _on_button_pressed );

func _on_button_pressed() -> void:
	
	var panel: Control = $Panel;
	if ( panel.visible ):
		XVIControlAnimation.close_window( panel );
	else:
		XVIControlAnimation.open_window( panel );
