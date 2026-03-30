# DragonXVI's Godot Plugins

This is a repository for all the plugins i've made.
Everything here is fully public and free to use, or modify to the license specs.


## XVI Utility

A condensed utility plugin that provides some scripts suited for quirks and 
tricks i usually do. Minimally invasive and you can delete and scripts that you
do not need.

### Drawing nodes

Simple shape drawing nodes i made for fun, can be useful for 2D models.
Also provides an asset folder with canvas shaders.
All made in GDScript.

### State Machines

A node based state machine and a ref counted one. Easy to build onto and provides
some common functionality.
Made in both GDScript and CSharp.

### Stripped Nodes

Some nodes i commonly strip exported properties from. Good for if you like 
setting these properties in code like me.
Currently only strips Area2D and CharacterBody2D, taking away exported collison
in favor of the code based approach.
Made in both GDScript and CSharp.


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
