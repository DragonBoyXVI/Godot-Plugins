using System;
using Godot;

namespace DragonXVI;

[GlobalClass, Tool]
public partial class AnimationModel2DCS : Node2D {
    
    /// <summary>
    /// List of all animation players this model uses.
    /// </summary>
    [Export]
    private AnimationPlayer[] AnimationPlayers = [];
    
    public override void _Ready()
    {
        base._Ready();
        
        if ( Engine.IsEditorHint() ){
            XVIFuncs.DisableNodeProcesses( this );
            return;
        }
        
    }
    /// <summary>
    /// Runs through each stored animation player and plays an animation of this name if it has that anim.
    /// </summary>
    /// <param name="animName">Name of the animation to play.</param>
    /// <param name="breakAtFirst">If true, only the first animation player with this anim plays it.</param>
    public void PlayAnimation( StringName animName, bool breakAtFirst = false ) {
        
        foreach (var animPlayer in AnimationPlayers)
        {
            if ( animPlayer.HasAnimation( animName ) ){
                animPlayer.Play( animName );
                if ( breakAtFirst ) break;
            }
        }
        
    }
}