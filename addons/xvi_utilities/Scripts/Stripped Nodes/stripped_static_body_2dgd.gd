@abstract
@tool
extends StaticBody2D;
class_name StrippedStaticBody2DGD;
## A [StaticBody2D] with some properties disabled, so that they can be enabled
## in code instead.
##
## NOTE: Some disabled properties are set to whatever is its OFF state,
## so you have to explicitly turn them back on.
## NOTE: Call super() in _init()!!!
