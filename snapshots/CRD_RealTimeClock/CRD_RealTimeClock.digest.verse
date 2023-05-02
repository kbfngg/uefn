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