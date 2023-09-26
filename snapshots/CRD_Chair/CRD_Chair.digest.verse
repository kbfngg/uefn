using {/Verse.org/Simulation}
# Creates a chair where `Agent`s can sit.
chair_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `Agent` sits on this device.
    # Sends the sitting `agent`.
    SeatedEvent<public>:listenable(agent) = external {}

    # Signaled when an `Agent` stops sitting on this device.
    # Sends the standing `Agent`.
    ExitedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    # An enabled chair can be interacted with and occupied
    # by any valid `agent`.
    Enable<public>():void = external {}

    # Disables this device.
    # A disabled chair cannot be interacted with,
    # and any `Agent` currently occupying the chair will be ejected.
    Disable<public>():void = external {}

    # Allows `Agent` to leave the chair, if `Agent` passes the tests.
    EnableExit<public>(Agent:agent):void = external {}

    # Prevents `Agent` from leaving the chair, if `Agent` passes the tests.
    # Agents will then be trapped in the chair until released.
    DisableExit<public>(Agent:agent):void = external {}

    # Makes `Agent` sit on this chair.
    Seat<public>(Agent:agent):void = external {}

    # Makes `Agent` exit this chair if they are currently in the chair.
    Eject<public>(Agent:agent):void = external {}

    # Returns true if `Agent` is currently in the chair .
    IsSeated<public>(Agent:agent)<transacts><decides>:void = external {}

    # Returns true if the chair is currently occupied.
    IsOccupied<public>()<transacts><decides>:void = external {}

    # Returns the `agent` currently occupying the chair.
    GetSeatedAgent<public>():?agent = external {}