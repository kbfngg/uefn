using {/Verse.org/Simulation}
# Used to create and customize your own visual effects. This is more flexible than the `vfx_spawner_device`,which gives you a selection of pre-made visual effects to choose from but limits how much you can customizeor change those effects.
vfx_creator_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Toggles between `Enable` and `Disable`.
    ToggleEnabled<public>():void = external {}

    # Starts playing the effect.
    Begin<public>():void = external {}

    # Starts the effect at `Agent`'s location. This option is only valid if *Stick to Player* is enabled.
    Begin<public>(Agent:agent):void = external {}

    # Starts the effect at every `agent`'s location. This option is only valid if *Stick to Player* is enabled.
    BeginForAll<public>():void = external {}

    # Ends playing the effect.
    End<public>():void = external {}

    # Ends the effect at `Agent`'s location. This option is only valid if *Stick to Player* is enabled.
    End<public>(Agent:agent):void = external {}

    # Ends the effect at every `agent`'s locations. This option is only valid if *Stick to Player* is enabled.
    EndForAll<public>():void = external {}

    # Toggles between `Begin` and `End`.
    Toggle<public>():void = external {}

    # Toggles between `Begin` and `End`.
    Toggle<public>(Agent:agent):void = external {}

    # Toggles between `BeginForAll` and `EndForAll`.
    ToggleForAll<public>():void = external {}

    # Pauses the effect if the effect is running. If the effect is paused, unpauses the effect. Pausing an effectcauses the effect to freeze in place.
    TogglePause<public>():void = external {}

    # Pauses the effect at `Agent`'s locations if it is playing, or resumes the effect if it is paused.When paused the effect freezes in place.
    TogglePause<public>(Agent:agent):void = external {}

    # Pauses the effect at every `agent`'s locations if it is playing, or resumes the effect if it is paused.When paused the effect freezes in place.
    TogglePauseForAll<public>():void = external {}

    # Removes the effect from `Agent` and continues playing at the device location. This option is only valid if*Stick to Player* is enabled.
    Remove<public>(Agent:agent):void = external {}

    # Removes the effect for every `agent` and continues playing at the device location. This option is only valid if*Stick to Player* is enabled.
    RemoveFromAll<public>():void = external {}

    # Spawns the effect at `Agent`'s location. This option is only valid if *Stick to Player* is enabled.
    SpawnAt<public>(Agent:agent):void = external {}