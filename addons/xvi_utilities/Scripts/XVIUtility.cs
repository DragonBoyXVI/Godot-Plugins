using System;
using System.Collections.Generic;
using Godot;

namespace DragonXVI;

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
public static class PropertyDetail
{
 	/// <summary>
	/// Name of propety as it appears in code.
	/// </summary>
	public static readonly StringName Name = new("name");
	/// <summary>
	/// String name of the BUILT IN class. But only if the property is a type object.
	/// </summary>
	public static readonly StringName ClassName = new("class_name");
	/// <summary>
	/// The Variant.Type of this property.
	/// </summary>
	public static readonly StringName Type = new("type");
	/// <summary>
	/// Determines how the editor displays and edits this property.
	/// </summary>
	public static readonly StringName Hint = new("hint");
	/// <summary>
	/// Used for the hint.
	/// </summary>
	public static readonly StringName HintString = new("hint_string");
	/// <summary>
	/// Defines how this property is used. 
	/// Ex. Is this a category instead of a property?
	/// </summary>
	public static readonly StringName Usage = new("usage");
}

/// <summary>
/// Constants for the dicts returned by raycasting.
/// </summary>
public static class RayDict
{
	/// <summary>
	/// Global position of the collision point.
	/// </summary>
	public static readonly StringName Position = new("position");
	/// <summary>
	/// Normal vector pointing at the collision point.
	/// Can be a zero vector if the collision happens inside a shape.
	/// </summary>
	public static readonly StringName Normal = new("normal");
	/// <summary>
	/// The [GodotObject] this hit, usually a node.
	/// Can be null if it collides with something made via the physics server.
	/// </summary>
	public static readonly StringName Object = new("object");
	/// <summary>
	/// Object it collided against (whatever that means...).
	/// </summary>
	public static readonly StringName ObjectID = new("object_id");
	/// <summary>
	/// The Rid of the hit object.
	/// </summary>
	public static readonly StringName RID = new("rid");
	/// <summary>
	/// The shape index of the hit collider.
	/// </summary>
	public static readonly StringName Shape = new("shape");
	/// <summary>
	/// Collider's metadata.
	/// </summary>
	public static readonly StringName Metadata = new("metadata");
}

/// <summary>
/// Simple interface for making autoloads easier to use in CS.
/// The Instance value can be set in any function you like, as long as teh autoload sets it.
/// </summary>
/// <typeparam name="T">The autoload type.</typeparam>
public interface IAutoload<T>
{
    public abstract static T Instance { get; protected set; }
}
public interface IStrippedProperties
{
	protected abstract static string[] StrippedProperties{ get; set; }
}

public class TestClass : IAutoload<TestClass>, IStrippedProperties
{
    static TestClass IAutoload<TestClass>.Instance { get; set; }
    static string[] IStrippedProperties.StrippedProperties { get; set; } = [];
}

/// <summary>
/// Holds some useful fuctions.
/// </summary>
public static class XVIUtil
{
    /// <summary>
    /// Disables all node processes that have a disable function.
    /// Such as process, physics process, input processes, etc.
    /// Useful for tool nodes, be sure to call this in _Ready rather than the constructor.
    /// </summary>
    /// <param name="node">The node to disable.</param>
    public static void DisableNodeProcesses(Node node)
	{
		node.SetProcess(false);
		node.SetPhysicsProcess(false);
		node.SetProcessInput(false);
		node.SetProcessShortcutInput(false);
		node.SetProcessUnhandledInput(false);
		node.SetProcessUnhandledKeyInput(false);
	}
}