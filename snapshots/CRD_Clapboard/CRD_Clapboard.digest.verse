clapboard_device<epic_internal> := class<concrete><final>(creative_device_base):
    TimeReachedEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}