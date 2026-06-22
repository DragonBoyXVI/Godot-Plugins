using Godot;

namespace DragonXVI;

/// <summary>
/// Holds some useful fuctions.
/// </summary>
public static class XVIFuncs
{
    /// <summary>
    /// Disables all node processes that have a disable function.
    /// Such as process, physics process, input processes, etc.
    /// Useful for tool nodes, be sure to call this in _Ready rather than the constructor.
    /// This effect can be reversed by using this again with "true" as the second arg.
    /// </summary>
    /// <param name="node">The node to disable.</param>
    public static void DisableNodeProcesses(Node node, bool enabled = false)
	{
		node.SetProcess(enabled);
		node.SetPhysicsProcess(enabled);
		node.SetProcessInput(enabled);
		node.SetProcessShortcutInput(enabled);
		node.SetProcessUnhandledInput(enabled);
		node.SetProcessUnhandledKeyInput(enabled);
	}
}