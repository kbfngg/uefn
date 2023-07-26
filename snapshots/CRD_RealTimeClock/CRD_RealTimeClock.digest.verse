using {/UnrealEngine.com/Temporary/SpatialMath}
# Used to trigger in game events based on real world time.
real_time_clock_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the optional second *Duration* time has been reached.
    DurationElapsedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target time is reached.
    TimeReachedEvent<public>:listenable(tuple()) = external {}

    # Signaled when this device is enabled after the target time has been reached.
    EnablingAfterTimeReachedEvent<public>:listenable(tuple()) = external {}

    # Signaled when this device is enabled before the target time has been reached.
    EnablingBeforeTimeReachedEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}