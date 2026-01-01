extends Node


## The key checked for what locale the translation belongs to.
const LOCALE_CHECK := "locale"


## Contains extra translation data.
## eg. An array of text you can randomly pick from.
var _extra_data: Dictionary[ String, Dictionary ] = {}


## Parses the provided dictionary into a translation,
## and adds it to the [TranslationServer].[br]
## If the dict is invalid, nothing happens and an error is printed.
func parse_dict_to_translation( translation_dict: Dictionary ) -> void:
	
	if ( not translation_dict.has( LOCALE_CHECK ) ):
		push_error( "Translation dict does not contain a locale key! Translations must have a \"", LOCALE_CHECK, "\" key." )
		return
