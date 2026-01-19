@abstract
extends Object;
class_name XVIUtility;
## A GLobal class that holds utility constants and functions.
##
## Not meant to be instanced, so dont lol


## Bitflags for the elemental system i use
enum Element {
	None = 0,
	Fire = 1<<0,
	Ice = 1<<1,
	Venom = 1<<2,
	Life = 1<<3,
	Elec = 1<<4,
}


## Radian angles for cardinal and diagnal directions in 2D.
const Direction2D: Dictionary[ String, float ]  = {
	"RIGHT": 0.0,
	"DOWN_RIGHT": ( PI * 0.25 ),
	"DOWN": ( PI * 0.5 ),
	"DOWN_LEFT": ( PI * 0.75 ),
	"LEFT": PI,
	"UPPER_LEFT": ( PI * 1.25 ),
	"UP": ( PI * 1.5 ),
	"UPPER_RIGHT": ( PI * 1.75 ),
}

## Property detials as returned by a get_propery_list() call.
## You prop wont need to use these, but i do lol.
const Property: Dictionary[ String, StringName ] = {
	"NAME": &"name",
	"CLASS_NAME": &"class_name",
	"TYPE": &"type",
	"HINT": &"hint",
	"HINT_STRING": &"hint_string",
	"USAGE": &"usage",
}
