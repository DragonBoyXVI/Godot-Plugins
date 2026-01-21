using System;
using System.Collections.Generic;
using Godot;

namespace DragonXVI;

[GlobalClass,Tool]
public partial class ElementCS : Resource
{
	public ElementCS() { }
	public ElementCS( Bits elem )
	{
		CurrentElement = elem;
	}

	[Flags]
	public enum Bits
	{
		None = 0,
		Fire = 1 << 0,
		Ice = 1 << 1,
		Venom = 1 << 2,
		Life = 1 << 3,
		Elec = 1 << 4,
	}
	public const string BitsString = "Fire:1,Ice:2,Venom:4,Life:8,Elec:16";

	public enum Effectiveness
	{
		Weak = -1,
		Neutral = 0,
		Strong = 1,
	}

	public Bits CurrentElement;

	private static Dictionary<string, int> Cache = [];

	public override Godot.Collections.Array<Godot.Collections.Dictionary> _GetPropertyList()
	{
		Godot.Collections.Array<Godot.Collections.Dictionary> properties = [];

		properties.Add(new Godot.Collections.Dictionary
		{
			{ PropertyDetail.Name, "CurrentElement" },
			{ PropertyDetail.Type, (int)Variant.Type.Int },
			{ PropertyDetail.Hint, (int)PropertyHint.Flags },
			{ PropertyDetail.HintString, BitsString },
		});

		return properties;
	}

	public int GetStrengthAgainst(ElementCS defendingElement)
	{
		return 0;
	}
}
