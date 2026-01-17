# DragonXVI's Godot Plugins

This is a repository for all the plugins i've made.
Everything here is fully public and free to use, or modify to the license specs.

## XVI State machines

A rather simple standalone state machine plugin.

### State Machine Lite

A simplistic int based state machine. Check the current state, do stuff,
change the state int and it'll emit some state related signals.

Both a GDScript and Csharp version are provided.

### Node Based State Machine

A Simple node based state machine. Seperate all your states into nodes,
and have all the functionality nodes provide. The abstract base state should be
extended to make your states machine compatible.

Both a GDScript and Csharp version are provided.

## Translation Importer

Godots usual translation system is a bit... meh in my opinion.
This addon adds a few more convinences to using translations, such as storing them
in JSON and allowing other types of data in them.

### User defined translations

This addon also lets you easily and safely allow players to add their own translations
to your project or game. 
Custom translations can overwrite offical translations, but they
cannot screw up offcial translations, as no files are ever written to,
and the custom translations can simply be deleted by the user.

### CSharp support

This addon is GDScript focused, a minimal helper script is provided but youll
have to treat it like any other autoload.

## Drawings

Mostly an asset pack with some simple shaders, also defines a few draw shape nodes
bc i felt like it. If you just want the shaders, you can delete everything else.

## XVI Utility

A utility plugin catered to the things i usually tend to do.
