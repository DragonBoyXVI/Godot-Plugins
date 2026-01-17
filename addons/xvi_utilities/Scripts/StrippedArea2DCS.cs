using System;
using System.Linq;
using Godot;
using Godot.Collections;

namespace DragonXVI;

/// <summary>
/// An Area2D with some properties stripped, so they can be
/// activated in code instead.
/// Deactivated properties are normally set to an "off" state.
/// </summary>
[GlobalClass,Tool]
public abstract partial class StrippedArea2DCS : Area2D
{
	public StrippedArea2DCS()
	{
		Monitoring = false;
		Monitorable = false;
		CollisionLayer = 0;
		CollisionMask = 0;
		InputPickable = false;
	}

	public override void _ValidateProperty(Dictionary property)
	{
		base._ValidateProperty(property);

		if (DisabledProperties.Contains( (string)property[Utility.Property.Name] ))
		{
			property[Utility.Property.Usage] = (long)PropertyUsageFlags.None;
		}
	}

	private static readonly string[] DisabledProperties = [
		Area2D.PropertyName.Monitoring,
		Area2D.PropertyName.Monitorable,
		CollisionObject2D.PropertyName.CollisionLayer,
		CollisionObject2D.PropertyName.CollisionMask,
		CollisionObject2D.PropertyName.InputPickable,
	];
}
