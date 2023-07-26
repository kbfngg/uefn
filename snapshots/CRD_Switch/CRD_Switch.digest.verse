using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to allow agents to turn other linked devices on/off or other custom state changes.
switch_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the switch is turned on by the specified `agent`.
    # Sends the `agent` that turned on the device.
    TurnedOnEvent<public>:listenable(agent) = external {}

    # Signaled when the switch is turned off by the specified `agent`.
    # Sends the `agent` that turned off the device.
    TurnedOffEvent<public>:listenable(agent) = external {}

    # Signaled if the switch is on when the state is checked.
    IfOnWhenCheckedEvent<public>:listenable(tuple()) = external {}

    # Signaled if the switch is off when the state is checked.
    IfOffWhenCheckedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the switch state is saved.
    StateSaveEvent<public>:listenable(tuple()) = external {}

    # Signaled when the switch state changes.
    StateChangesEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Turns on this device with `Agent` acting as the instigator of the action.
    TurnOn<public>(Agent:agent):void = external {}

    # Turns off the device with `Agent` acting as the instigator of the action.
    TurnOff<public>(Agent:agent):void = external {}

    # Toggles between `TurnOn` and `TurnOff` with `Agent` acting as the instigator of the action.
    ToggleState<public>(Agent:agent):void = external {}

    # Loads the device state with `Agent` acting as the instigator of the action.
    LoadState<public>(Agent:agent):void = external {}

    # Saves the device state with `Agent` acting as the instigator of the action.
    SaveState<public>(Agent:agent):void = external {}

    # Checks the device state with `Agent` acting as the instigator of the action.
    CheckState<public>(Agent:agent):void = external {}

    # Clears persistence data for `Agent`.
    ClearPersistenceData<public>(Agent:agent):void = external {}

    # Clears persistence data for all `agent`s.
    ClearAllPersistenceData<public>():void = external {}

    # Returns the current state of this switch: true (on) or false (off). Use this overload  of `GetCurrentState` when this device has *Store State Per Player* set to *Yes*.
    GetCurrentState<public>(Agent:agent)<transacts><decides>:void = external {}

    # Returns the current state of this switch: true (on) or false (off). Use this overload  of `GetCurrentState` when this device has *Store State Per Player* set to *No*.
    GetCurrentState<public>()<transacts><decides>:void = external {}

    # Query whether this device has a single global on/off state, or has a personalized on/off state for each individual agent.
    IsStatePerAgent<public>()<transacts><decides>:void = external {}

    # Sets the *Interaction Time* required to activate this device (in seconds).
    SetInteractionTime<public>(Time:float):void = external {}

    # Returns the *Interaction Time* required to activate this device (in seconds).
    GetInteractionTime<public>()<transacts>:float = external {}

    # Sets the *Turn On Text* to be displayed to a user when the switch is currently off, and offers an interaction to switch it on. Clamped to 150 characters.
    SetTurnOnInteractionText<public>(Text:message):void = external {}

    # Sets the *Turn Off Text* to be displayed to a user when the switch is currently on, and offers an interaction to switch it off. Clamped to 150 characters.
    SetTurnOffInteractionText<public>(Text:message):void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}