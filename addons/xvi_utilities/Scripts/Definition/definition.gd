@abstract
extends Resource;
class_name Definition;
## Base resource for defs.
##
## docs are really importent i should do them...


## Class name for what type of def this is.
## Eg, EnemyDef, LevelDef, AbilityDef, whatever
@abstract func get_def_class() -> String;


@export var def_name: StringName = &"";
