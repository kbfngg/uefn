using {/Verse.org/Colors}
using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /UnrealEngine.com/Temporary/Diagnostics
Diagnostics<public> := module:
    # Enumerated presets for policies describing a desired draw duration.
    debug_draw_duration_policy<native><public> := enum:
        SingleFrame
        FiniteDuration
        Persistent

    # debug_draw_channel is the base class used to define debug draw channels.
    debug_draw_channel<native><public> := class<abstract>:


    # debug draw class to draw debug shapes on screen.
    debug_draw<native><public> := class:
        # Channel will be used to clear specific debug draw.
        Channel<native><public>:subtype(debug_draw_channel) = external {}

        # Show Debug Draw for the channel for all users.
        ShowChannel<native><public>()<transacts>:void

        # Hide Debug Draw for the channel for all users.
        HideChannel<native><public>()<transacts>:void

        # Clears all debug draw for the channel.
        ClearChannel<native><public>()<transacts>:void

        # Clears all debug draw from this debug_draw instance.
        Clear<native><public>()<transacts>:void

        # Draws a sphere at the named location, and using the provided draw parameters.
        DrawSphere<native><public>(Center:vector3, ?Radius:float = external {}, ?Color:color = external {}, ?NumSegments:int = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a box at the named location, and using the provided draw parameters
        DrawBox<native><public>(Center:vector3, Rotation:rotation, ?Extent:vector3 = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a capsule at the named location, and using the provided draw parameters.
        DrawCapsule<native><public>(Center:vector3, Rotation:rotation, ?Height:float = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a cone at the named location, and using the provided draw parameters.
        DrawCone<native><public>(Origin:vector3, Direction:vector3, ?Height:float = external {}, ?NumSides:int = external {}, ?AngleWidthRadians:float = external {}, ?AngleHeightRadians:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a cylinder at the named location, and using the provided draw parameters.
        DrawCylinder<native><public>(Start:vector3, End:vector3, ?NumSegments:int = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a line from Start to End locations, and using the provided draw parameters.
        DrawLine<native><public>(Start:vector3, End:vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a point at the named location, and using the provided draw parameters.
        DrawPoint<native><public>(Position:vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
        DrawArrow<native><public>(Start:vector3, End:vector3, ?ArrowSize:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

    # log levels available for various log commands
    log_level<native><public> := enum:
        Debug
        Verbose
        Normal
        Warning
        Error

    # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
    log_channel<native><public> := class<abstract>:


    # log class to send messages to the default log
    log<native><public> := class:
        # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
        Channel<native><public>:subtype(log_channel)

        # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
        DefaultLevel<native><public>:log_level = external {}

        # Print message using the given log level
        (log:)Print<native><public>(Message:string, ?Level:log_level = external {})<computes>:void

        # Prints current script call stack using the give log level
        PrintCallStack<native><public>(?Level:log_level = external {})<computes>:void

# Module import path: /UnrealEngine.com/Temporary/Curves
Curves<public> := module:
    editable_curve<native><public> := class<final><concrete>:
        # Evaluates this float curve at the specified time and returns the result as a float
        Evaluate<native><public>(Time:float):float