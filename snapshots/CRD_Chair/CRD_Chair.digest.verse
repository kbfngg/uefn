using {/Verse.org/Simulation}
# Creates a chair where `Agent`s can sit.
chair_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` sits on the Chair.
    # Sends the sitting `agent`.
    SeatedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` stops sitting on the Chair.
    # Sends the standing `Agent`.
    ExitedEvent<public>:listenable(agent) = external {}

    # Enables the Chair.
    # An enabled Chair can be interacted with and occupied
    # by any `agent` that meets the requirements.
    Enable<public>():void = external {}

    # Disables the Chair.
    # A disabled Chair cannot be interacted with
    # and any `agent` currently occupying the Chair will be ejected.
    Disable<public>():void = external {}

    # Allows any seated `agent` to leave the chair manually.
    EnableExit<public>():void = external {}

    # Prevents any seated `agent` from leaving the Chair manually.
    # While Exit is disabled, call Eject to force them out.
    DisableExit<public>():void = external {}

    # Makes `Agent` sit on this chair if they meet the requirements.
    Seat<public>(Agent:agent):void = external {}

    # Ejects any `agent` currently in the chair.
    Eject<public>():void = external {}

    # Makes `Agent` exit this chair if they are currently in the chair.
    Eject<public>(Agent:agent):void = external {}

    # Succeeds if `Agent` is currently in the chair .
    IsSeated<public>(Agent:agent)<transacts><decides>:void = external {}

    # Succeeds if the chair is currently occupied.
    IsOccupied<public>()<transacts><decides>:void = external {}

    # Returns the `agent` currently occupying the chair.
    GetSeatedAgent<public>():?agent = external {}