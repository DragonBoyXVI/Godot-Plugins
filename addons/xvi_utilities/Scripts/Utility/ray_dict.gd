@abstract
extends Object;
class_name RayDict;
## Helper class for dictionaries returned by ray casting functions.
##
## ditto


## Global position of the collision.
const POSITION := &"position";
## Normal vector of the collision.[br]
## Can be a zero vector if the collision happens inside a shape.
const NORMAL := &"normal";
## [Object] this collided with (or null if made vai the physics server)
const OBJECT := &"object";
## Object it collided against (wht does that mean????)
const OBJECT_ID := &"object_id";
## [RID] of the hit object.
const Rid := &"rid";
## Shape index of the hit collider.
const SHAPE := &"shape";
## Collider's metadata.
const METADATA := &"metadata";
