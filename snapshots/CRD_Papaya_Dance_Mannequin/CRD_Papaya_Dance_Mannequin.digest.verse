using {/Verse.org/Simulation}
# Used to project a hologram of a character performing dance emotes.
dance_mannequin_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates the hologram using *Default Preset* options.
    ActivateDefaultPreset<public>():void = external {}

    # Activates the hologram using *Preset 2* options.
    ActivatePreset2<public>():void = external {}

    # Activates the hologram using *Preset 3* options.
    ActivatePreset3<public>():void = external {}

    # Activates the hologram using `Agent`'s skin and emotes.
    ActivateSkinAndEmoteCapture<public>(Agent:agent):void = external {}

    # Deactivates the hologram.
    DeactivateSkinAndEmoteCapture<public>():void = external {}

# Used to capture `agent` dance moves.
dance_capture_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Signaled when this device is deactivated by an `agent`.
    # Sends the `agent` that deactivated this device.
    DeactivatedEvent<public>:listenable(agent) = external {}