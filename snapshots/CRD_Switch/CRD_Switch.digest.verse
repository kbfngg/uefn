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

    # Signaled when the switch state is loaded by the specified `agent`.
    # Sends the `agent` that loaded the state on the device.
    StateLoadEvent<public>:listenable(agent) = external {}

    # Signaled when the persistent data is cleared by the specified `agent`.
    # Sends the `agent` that cleared persistent data on the device.
    ClearEvent<public>:listenable(agent) = external {}

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

    # Loads the device state for all players.
    LoadStateForAll<public>():void = external {}

    # Saves the device state for all players
    SaveStateForAll<public>():void = external {}

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

    # Sets the state of the switch to a specific value for a specific `Agent`.
    #  Use when the device has *Store State Per Player* set to *Yes*.
    SetState<public>(Agent:agent, State:logic):void = external {}

    # Sets the state of the switch to a specific value.
    #  Use when the device has *Store State Per Player* set to *No*.
    SetState<public>(State:logic):void = external {}

    # Updates the *State Reset Time* for the device, in seconds, clamped to the Min and Max defined in the device.
    #  This will not apply to any state reset timers currently in effect.
    #  Set to 0.0 to disable the State Reset Time. Set to less than 0.0 to reset to default.
    SetStateResetTime<public>(Time:float):void = external {}

    # Updates the *State Reset Time* for the device, in seconds,for a specific player (if *Store State Per Player* is *Yes*), clamped to the Min and Max defined in the device.
    #  This will not apply to any state reset timers currently in effect.
    #  Set to 0.0 to disable the State Reset Time. Set to less than 0.0 to reset to default.
    SetStateResetTime<public>(Agent:agent, Time:float):void = external {}

    # Returns the value of *State Reset Time*, in seconds, for the device. Returns -1.0 if *State Reset Time* is not used.
    GetStateResetTime<public>()<transacts>:float = external {}

    # Returns the value of *State Reset Time*, in seconds, for the device, for a specific player. Returns -1.0 if *State Reset Time* is not used.
    GetStateResetTime<public>(Agent:agent)<transacts>:float = external {}

    # Returns the time, in seconds, before the switch will reset itself to default.
    #  Returns -1.0 if *Store State Per Player* is *Yes* or if  there is no active reset timer.
    GetCurrentResetTime<public>():float = external {}

    # Returns the time, in seconds, before the switch will reset itself to default for *Agent*.
    #  Returns -1.0 if there is no active reset timer.
    GetCurrentResetTime<public>(Agent:agent):float = external {}