using Godot;

namespace DragonXVI;

/// <summary>
/// Simple match based state machine wrapper.
/// Also emits godot signals when the "state" is changed.
/// </summary>
public partial class StateMachineLite : RefCounted
{
    /// <summary>
    /// Emitted after the state is changed.
    /// </summary>
    /// <param name="state">The new state</param>
    [Signal]
    public delegate void StateEnteredEventHandler(int state);
    /// <summary>
    /// Emitted before the state is changed.
    /// </summary>
    /// <param name="state">The old state</param>
    [Signal]
    public delegate void StateLeftEventHandler(int state);

    private int State;

    public int GetState()
    {
        return State;
    }

    public void SetState( int state )
    {
        EmitSignal(SignalName.StateLeft, State);
        State = state;
        EmitSignal(SignalName.StateEntered, State);
    }
}
