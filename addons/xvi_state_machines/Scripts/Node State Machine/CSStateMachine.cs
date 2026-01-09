using System.Collections.Generic;
using Godot;

namespace DragonXVI.StateMachines;

/// <summary>
/// A root node based state machine.
/// </summary>
[GlobalClass, Icon("res://addons/xvi_state_machines/Icons/machine.atlastex")]
public partial class CSStateMachine : Node
{
    /// <summary>
    /// Emitted when a state is entered.
    /// </summary>
    /// <param name="state">New State</param>
    [Signal]
    public delegate void StateEnteredEventHandler(CSState state);
    /// <summary>
    /// Emitted when a state is left.
    /// </summary>
    /// <param name="state">Old state.</param>
    [Signal]
    public delegate void StateLeftEventHandler(CSState state);

    /// <summary>
    /// The state this switches to when readied.
    /// </summary>
    [Export]
    public CSState InitialState;

    public CSState CurrentState;
    private readonly Dictionary<StringName, CSState> StateCache = [];

    public override void _Ready()
    {
        base._Ready();

        Godot.Collections.Array<Node> children = GetChildren();
        for (int i = 0; i < children.Count; i++)
        {
            if (children[i] is CSState state)
            {
                RegisterState(state);
            }
        }
        
        if (InitialState != null)
        {
            ChangeState(InitialState.Name);
        }        
        
    }

    /// <summary>
    /// Used to add a state to this machine.
    /// Normally only called on this machines children when readied.
    /// </summary>
    /// <param name="state">The state to register.</param>
    public void RegisterState(CSState state)
    {
        if (StateCache.ContainsKey(state.Name))
        {
            GD.PushError("Trying to add dupe state: ", state.Name);
            return;
        }

        StateCache[state.Name] = state;
        state._Disable();
        state.StateChangeRequested += OnStateChangeRequested;
    }
    /// <summary>
    /// Changes the current state,
    /// </summary>
    /// <param name="StateName">Name of the state to change to.</param>
    public void ChangeState(StringName stateName)
    {
        if (!StateCache.TryGetValue(stateName, out CSState newState))
        {
            GD.PushError("Trying to switch to a state we dont have: ", stateName);
            return;
        }

        if (CurrentState != null)
        {
            if (!CurrentState._CanSwitchState(newState))
            {
                return;
            }

            CurrentState._LeaveState();
            CurrentState._Disable();
            EmitSignal(SignalName.StateLeft, CurrentState);
        }

        CurrentState = newState;
        CurrentState._Enable();
        CurrentState._EnterState();
        EmitSignal(SignalName.StateEntered, CurrentState);
    }


    private void OnStateChangeRequested(StringName stateName)
    {
        ChangeState(stateName);   
    }
}
