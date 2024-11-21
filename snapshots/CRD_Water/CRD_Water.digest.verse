using {/Verse.org/Simulation}
# Used to create and manipulate volumes of water where players can swim, fish, or drive boats.
water_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` enters the water.
    # Sends `agent` that entered the water.
    AgentEntersWaterEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the water.
    # Sends `agent` that exited the water.
    AgentExitsWaterEvent<public>:listenable(agent) = external {}

    # Signals when the volume is filled to the water level set in the *Default Vertical Water Percentage* option.
    VerticalFillingCompletedEvent<public>:listenable(tuple()) = external {}

    # Signals when the water volume is completely empty.
    VerticalEmptyingCompletedEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the water level in the volume to the value set in the *Default Vertical Water Percentage* option.
    Reset<public>():void = external {}

    # Starts vertically emptying the water in the volume.
    BeginVerticalEmptying<public>():void = external {}

    # Starts vertically filling the water in the volume.
    BeginVerticalFilling<public>():void = external {}

    # Stops filling or emptying the volume.
    StopVerticalMovement<public>():void = external {}

    # Resumes either filling or emptying the volume.
    ResumeVerticalMovement<public>():void = external {}