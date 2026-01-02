extends Node


## The key checked for what locale the translation belongs to.
const LOCALE_CHECK := "locale"


## Contains extra translation data.
## eg. An array of text you can randomly pick from.
var _extra_data: Dictionary[ String, Dictionary ] = {}


func get_extra_data( key: String, locale: String = TranslationServer.get_locale() ) -> Variant:
	
	if ( not _extra_data.has( locale ) ):
		push_error( "Getting extra data for a locale we dont have! ", locale )
		return null
	
	var data: Dictionary = _extra_data[ locale ]
	if ( not data.has( key ) ):
		push_error( "Getting extra data that we dont have! ", locale, " ", key )
		return null
	
	return data[ key ]


## Parses the provided dictionary into a translation,
## and adds it to the [TranslationServer].[br]
## NOTE: If this defines extra data that is already defined for that language,
## it will be overwritten by the most recent parse.[br]
## If the dict is invalid, nothing happens and an error is printed.
func parse_dict_to_translation( translation_dict: Dictionary ) -> void:
	
	if ( not translation_dict.has( LOCALE_CHECK ) ):
		push_error( "Translation dict does not contain a locale key! Translations must have a \"", LOCALE_CHECK, "\" key." )
		return
	
	var translation := Translation.new()
	var extra: Dictionary = {}
	for key: Variant in translation_dict.keys():
		
		# we can only add strings as keys
		if ( typeof( key ) != TYPE_STRING ):
			continue
		
		var value: Variant = translation_dict[ key ]
		if ( typeof( value ) == TYPE_STRING ):
			
			translation.add_message( key, value )
		else:
			
			extra[ key ] = value
	
	var locale: String = translation_dict[ LOCALE_CHECK ]
	translation.locale = locale
	TranslationServer.add_translation( translation )
	_extra_data[ locale ] = extra
