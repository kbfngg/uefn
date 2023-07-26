using {/UnrealEngine.com/Temporary/SpatialMath}
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

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}