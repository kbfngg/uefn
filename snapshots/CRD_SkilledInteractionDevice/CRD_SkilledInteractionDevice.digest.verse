using {/Verse.org/Simulation}
# Used to build quick-time style minigames.
skilled_interaction_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled when the `agent` provides a good input.
    # Sends the `agent` that provided the input.
    # Sends the `float` position of the meter scrubber from `0.0` to `1.0`.
    GoodInputEvent<epic_internal>:listenable(tuple(agent, float)) = external {}

    # Signaled when an `agent` provides a perfect input.
    # Sends the `agent` that provided the input.
    # Sends the `float` position of the meter scrubber from `0.0` to `1.0`.
    PerfectInputEvent<epic_internal>:listenable(tuple(agent, float)) = external {}

    # Signaled when an `agent` provides a bad input.
    # Sends the `agent` that provided the input.
    # Sends the `float` position of the meter scrubber from `0.0` to `1.0`.
    BadInputEvent<epic_internal>:listenable(tuple(agent, float)) = external {}

    # Signaled when the interaction is completed successfully.
    # Sends the relevant `agent` for the interaction.
    InteractSucceededEvent<epic_internal>:listenable(agent) = external {}

    # Signaled when the interaction is failed.
    # Sends the relevant `agent` for the interaction.
    InteractFailedEvent<epic_internal>:listenable(agent) = external {}

    # Signaled when the interaction is interrupted.
    # Sends the relevant `agent` for the interaction.
    InteractInterruptedEvent<epic_internal>:listenable(agent) = external {}

    # Enables this device.
    Enable<epic_internal>():void = external {}

    # Disables this device.
    Disable<epic_internal>():void = external {}

    # Begins the interaction for the provided `Agent`.
    # Will cancel any other skilled interaction already in progress.
    BeginInteraction<epic_internal>(Agent:agent):void = external {}

    # Cancels the interaction, if in progress, for the provided `Agent`.
    EndInteraction<epic_internal>(Agent:agent):void = external {}

    # Query whether the interaction is active or not for the provided `Agent`.
    IsActive<epic_internal>(Agent:agent)<transacts><decides>:void = external {}

    # Sets the *Header Text* for the interaction.
    SetHeaderText<epic_internal>(Text:message):void = external {}

    # Returns the *Header Text* for the interaction.
    GetHeaderText<epic_internal>()<transacts>:string = external {}

    # Sets the *Description Text* for the interaction.
    SetDescriptionText<epic_internal>(Text:message):void = external {}

    # Returns the *Description Text* for the interaction.
    GetDescriptionText<epic_internal>()<transacts>:string = external {}

    # Sets the *Interaction Label Text* for the interaction.
    SetInteractionLabelText<epic_internal>(Text:message):void = external {}

    # Returns the *Interaction Label Text* for the interaction.
    GetInteractionLabelText<epic_internal>()<transacts>:string = external {}

    # Sets the *Good Zone Size*.
    # Size is a ratio of the total meter, and is clamped between `0.0` and `1.0`.
    SetGoodZoneSize<epic_internal>(Size:float):void = external {}

    # Returns the *Good Zone Size* as a ratio of the total meter, from `0.0` to `1.0`.
    # Does not account for *Shrink Zones on Subsequent Interacts*.
    GetGoodZoneSize<epic_internal>()<transacts>:float = external {}

    # Sets the *Perfect Zone Size*.
    # Size is a ratio of the Good Zone, and is clamped between `0.0` and `1.0`.
    SetPerfectZoneSize<epic_internal>(Size:float):void = external {}

    # Returns the *Perfect Zone Size* as a ratio of the Good Zone, from `0.0` to `1.0`.
    # Does not account for *Shrink Zones on Subsequent Interacts*.
    GetPerfectZoneSize<epic_internal>()<transacts>:float = external {}

    # Sets the *Movement Speed*.
    # Value is clamped between `1.0` and `400.0`.
    SetMovementSpeed<epic_internal>(Speed:float):void = external {}

    # Returns the *Movement Speed*.
    # Does not account for *Speed Up on Subsequent Interacts*.
    GetMovementSpeed<epic_internal>()<transacts>:float = external {}

    # Sets *Success Target*.
    # Success Target refers to how many successful inputs a player must provide to complete the minigame.
    # Set to `0` for no limit.  Maximum is clamped at `5`.
    SetSuccessTarget<epic_internal>(Count:int):void = external {}

    # Returns *Success Limit*.
    GetSuccessTarget<epic_internal>()<transacts>:int = external {}

    # Sets *Failure Limit*.
    # Failure Limit refers to how many bad inputs a player can provide before failing the minigame.
    # Set to `0` for no limit.  Maximum is clamped at `5`.
    SetFailureLimit<epic_internal>(Count:int):void = external {}

    # Returns *Failure Limit*.
    GetFailureLimit<epic_internal>()<transacts>:int = external {}

    # Sets the *Interact Time Limit*.
    # Set to `0.0` for no time limit.  Maximum is clamped at `20.0`.
    SetInteractTimeLimit<epic_internal>(Time:float):void = external {}

    # Returns the *Interact Time Limit*.
    GetInteractTimeLimit<epic_internal>()<transacts>:float = external {}

    # Sets the *Lockout On Fail Time*.
    # Set to `0.0` for no lockout.  Maximum is clamped at `5.0`.
    SetFailLockoutTime<epic_internal>(Time:float):void = external {}

    # Returns *Lockout On Fail Time*.
    GetFailLockoutTime<epic_internal>()<transacts>:float = external {}