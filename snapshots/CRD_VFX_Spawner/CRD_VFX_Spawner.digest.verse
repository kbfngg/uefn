using {/Verse.org/Simulation}
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

    # Restarts the VFX. Triggers the VFX if it's Burst VFX.
    Restart<public>():void = external {}

# Used to transform character appearance.
character_transformation_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Transforms `Agent` into the character configured by this device.
    TransformInto<public>(Agent:agent):void = external {}

    # Plays the transform effect for `Agent`.
    TransformIntoEffectAvatar<public>(Agent:agent):void = external {}

    # Sets `Agent` visibility to invisible.
    Hide<public>(Agent:agent):void = external {}