using {/Verse.org/Simulation}
# Used to move around a building or prop, and customize responses to various collision event types.
prop_mover_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is enabled.
    EnabledEvent<public>:listenable(tuple()) = external {}

    # Signaled when this device is disabled.
    DisabledEvent<public>:listenable(tuple()) = external {}

    # Signaled when the prop movement begins.
    BeganEvent<public>:listenable(tuple()) = external {}

    # Signaled when the prop movement ends.
    EndedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the prop reaches its destination.
    FinishedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the prop changes its direction.
    MovementModeChangedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the prop hits an `agent`.
    # Sends the `agent` hit by the prop.
    AgentHitEvent<public>:listenable(agent) = external {}

    # Signaled when the prop hits a creature, animal, or NPC.
    AIHitEvent<public>:listenable(tuple()) = external {}

    # Signaled when the prop hits another prop.
    PropHitEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Moves the prop to its original position.
    Reset<public>():void = external {}

    # Begins the prop moving.
    Begin<public>():void = external {}

    # Ends the prop moving.
    End<public>():void = external {}

    # Moves the prop forward based on this device's default configuration, ignoring the prop's previous movement.
    Advance<public>():void = external {}

    # Reverses the prop's moving direction.
    Reverse<public>():void = external {}

    # Sets the total distance (in meters) that the prop will move.
    SetTargetDistance<public>(InDistance:float):void = external {}

    # Returns the total distance (in meters) that the prop will move.
    GetTargetDistance<public>()<transacts>:float = external {}

    # Sets the speed (in meters per second) at which the prop will move to its destination.
    SetTargetSpeed<public>(Speed:float):void = external {}

    # Returns the speed (in meters per second) at which the prop mover will move the prop to its destination.
    GetTargetSpeed<public>()<transacts>:float = external {}