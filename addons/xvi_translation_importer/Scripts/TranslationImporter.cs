using Godot;

namespace DragonXVI.Translation;

/// <summary>
/// CSharp helper to make using the importer easier.
/// </summary>
public class TranslationImporter
{
    /// <summary>
    /// Nodepath to the autoload
    /// </summary>
    public static readonly NodePath AutoloadPath = new("/root/TranslationImporter");

    public class MethodName
    {
        public static readonly StringName GetExtraData = new("get_extra_data");
        public static readonly StringName ParseFileForDict = new("parse_file_for_dict");
        public static readonly StringName ParseDictToTranslation = new("parse_dict_to_translation");
    }
}
