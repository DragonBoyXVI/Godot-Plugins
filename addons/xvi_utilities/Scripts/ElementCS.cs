using System;
using System.Collections.Generic;
using Godot;

namespace DragonXVI;

[GlobalClass]
public partial class ElementCS : Resource
{
	public ElementCS( Bits elem = Bits.None )
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

	public enum Effectiveness
	{
		Weak = -1,
		Neutral = 0,
		Strong = 1,
	}

	[Export]
	public Bits CurrentElement;

	private static Dictionary<string, int> Cache = [];

	public int GetStrengthAgainst( ElementCS defendingElement )
	{
		return 0;
	}
}
