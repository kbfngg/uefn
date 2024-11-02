using {/Verse.org/Simulation}
# Used to show or hide parts of the HUD for players or teams. Use this with other devices such as the `hud_message_device`, `map_indicator_device`, and `billboard_device` to control exactly how much information players can see during a game, as well as how and when they see that information.
hud_controller_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Sets the *Affected Class* option to `Agent`'s class.
    UpdateAffectedClass<public>(Agent:agent):void = external {}

    # Sets the *Affected Team* option to `Agent`'s team.
    UpdateAffectedTeam<public>(Agent:agent):void = external {}

    # Resets the *Affected Class* option to its starting value.
    ResetAffectedClass<public>():void = external {}

    # Resets the *Affected Team* option to its starting value.
    ResetAffectedTeam<public>():void = external {}