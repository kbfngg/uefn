# Used to place visual effects around your island. You can use these effects to enhance the overall theme and experience of your game.
vfx_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the effect is enabled.
    EffectEnabledEvent<public>:listenable(tuple()) = external {}

    # Signaled when the effect is disabled.
    EffectDisabledEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}