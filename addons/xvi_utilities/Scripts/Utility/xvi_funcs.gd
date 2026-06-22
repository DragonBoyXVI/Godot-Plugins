@abstract
extends Object;
class_name XVIFuncs;
## Global class with some useful functions.
##
## Destription 2 waow.


## Disables all node processes that have a disable function.
## Such as process, physics process, input processes, etc.
## Useful for tool nodes, be sure to call this in _ready rather than _init.[br]
## This effect can be reversed by using this again and passing "true" for the
## second arg.
static func disable_node_processes( node: Node, enabled: bool = false ) -> void:
	
	node.set_process( enabled );
	node.set_physics_process( enabled );
	node.set_process_input( enabled );
	node.set_process_shortcut_input( enabled );
	node.set_process_unhandled_input( enabled );
	node.set_process_unhandled_key_input( enabled );
