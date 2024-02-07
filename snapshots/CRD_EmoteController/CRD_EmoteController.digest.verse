using {/Verse.org/Simulation}
emote_controller_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Enables `agent` emote effects.
    EnableAgentEffects<public>():void = external {}

    # Disables `agent` emote effects.
    DisableAgentEffects<public>():void = external {}

    # Grants emote item to `Agent`.
    GrantEmoteItem<public>(Agent:agent):void = external {}

    # Grants emote item all `agent`s.
    GrantEmoteItemAll<public>():void = external {}