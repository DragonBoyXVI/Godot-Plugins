using Godot;

namespace DragonXVI;

/// <summary>
/// A utility class that holds constants, methods, and other goodies.
/// </summary>
public partial class Utility
{
	/// <summary>
	/// List of double angles for use in 2D.
	/// </summary>
	public static class Direction2D
	{
		public const double Right = 0.0;
		public const double DownRight = double.Pi * 0.25;
		public const double Down = double.Pi * 0.5;
		public const double DownLeft = double.Pi * 0.75;
		public const double Left = double.Pi;
		public const double UpperLeft = double.Pi * 1.25;
		public const double Up = double.Pi * 1.5;
		public const double UpperRight = double.Pi * 1.75;

	}
	/// <summary>
	/// Constants for the property dicts as returned by GetPropertyList().
	/// </summary>
	public static class Property
	{
		public static readonly StringName Name = new("name");
		public static readonly StringName ClassName = new("class_name");
		public static readonly StringName Type = new("type");
		public static readonly StringName Hint = new("hint");
		public static readonly StringName HintString = new("hint_string");
		public static readonly StringName Usage = new("usage");
	}
}
