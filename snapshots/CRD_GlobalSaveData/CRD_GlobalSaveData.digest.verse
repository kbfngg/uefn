using {/Verse.org/Simulation}
shared_saved_data_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled if the save result is on when the state is checked.
    # Sends the `agent` that initiated the check.
    CheckResultOnEvent<public>:listenable(agent) = external {}

    # Signaled if the save result is off when the state is checked.
    # Sends the `agent` that initiated the check.
    CheckResultOffEvent<public>:listenable(agent) = external {}

    # Signaled when state is saved.
    # Sends the `agent` that initiated the save.
    StateSaveEvent<public>:listenable(agent) = external {}

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