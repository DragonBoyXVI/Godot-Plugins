@tool
extends Resource
class_name ElementGD


enum Bits {
	None = 0,
	Fire = 1<<0,
	Ice = 1<<1,
	Venom = 1<<2,
	Life = 1<<3,
	Elec = 1<<4,
}
const BITS_STRING := "Fire:1,Ice:2,Venom:4,Life:8,Elec:16";

enum Effectiveness {
	WEAK = -1,
	NEUTRAL = 0,
	STRONG = 1,
}


static var _cache: Dictionary[ String, int ] = {};


var current_element: int = Bits.None;


func _init( elem: Bits = Bits.None ) -> void:
	current_element = elem;

func _get_property_list() -> Array[ Dictionary ]:
	var properties: Array[ Dictionary ] = [];
	
	properties.append( {
		XVIUtility.Property.NAME: "current_element",
		XVIUtility.Property.TYPE: TYPE_INT,
		XVIUtility.Property.HINT: PROPERTY_HINT_FLAGS,
		XVIUtility.Property.HINT_STRING: BITS_STRING,
	} );
	
	return properties;
