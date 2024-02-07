using {/Verse.org/Simulation}
# Gives the ability to save player progress, location, resources and stats persistently across games.
save_point_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled when data is saved for an `agent`.
    ActivationEvent<public>:listenable(agent) = external {}

    # Signaled when data is loaded for an `agent`.
    LoadedEvent<public>:listenable(agent) = external {}

    # Signaled when data is cleared for an `agent`.
    ClearedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Save data for `Agent`. This function does nothing if `Agent` is already eliminated.
    Save<public>(Agent:agent):void = external {}

    # Load data for `Agent`.
    Load<public>(Agent:agent):void = external {}

    # Clears all saved data for `Agent`.
    ClearData<public>(Agent:agent):void = external {}

    # Clears all saved data for all `agent`s in the current session.
    ClearDataForAll<public>():void = external {}

    # Saves Data for all players in the current session.
    SaveDataForAll<public>():void = external {}

    # Loads Data for all players in the current session.
    LoadDataForAll<public>():void = external {}

    # Sets whether the `agent`'s data is automatically saved while they play.
    SetAutoSaveEnabled<public>(Enabled:logic):void = external {}

    # Returns whether the `agent`'s data is automatically saved while they play.
    GetAutoSaveEnabled<public>()<transacts>:logic = external {}