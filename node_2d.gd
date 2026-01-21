extends Node2D


@export var elemgd1: ElementGD;
@export var elemgd2: ElementGD;


func _ready() -> void:
	
	print( " 1 attacks 2:  ", elemgd1.get_strength_against( elemgd2 ) );
	print( " 2 attacks 1:  ", elemgd2.get_strength_against( elemgd1 ) );
	print( ElementGD._cache );
