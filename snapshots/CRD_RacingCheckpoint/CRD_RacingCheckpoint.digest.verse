using {/Verse.org/Simulation}
# Used in tandem with `race_manager_device` to define the route players must traverse.
race_checkpoint_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this checkpoint becomes the next checkpoint that `agent`s need to pass for the first time.
    # Sends the first `agent` who is now targeting this checkpoint.
    CheckpointBecomesCurrentForTheFirstTimeEvent<public>:listenable(agent) = external {}

    # Signaled when this checkpoint becomes the current checkpoint for `agent`.
    # Sends the `agent` who is now targeting this checkpoint.
    CheckpointBecomesCurrentEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` passes this checkpoint.
    # Sends the `agent` that passed this checkpoint.
    CheckpointCompletedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Sets this checkpoint as the current checkpoint for `Agent`. This only functions if `Agent` has not already passed this checkpoint.
    SetAsCurrentCheckpoint<public>(Agent:agent):void = external {}

# Used with the `race_checkpoint_device` to create more advanced racing modes.
race_manager_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the race begins.
    # Sends the `agent` that started the race.
    RaceBeganEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` finishes the race.
    # Sends the `agent` that finished the race.
    RaceCompletedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` completes their first lap.
    # Sends the `agent` that finished the lap.
    FirstLapCompletedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` completes a lap.
    # Sends the `agent` that finished the lap.
    LapCompletedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Begins the race.
    Begin<public>():void = external {}

    # Ends the race.
    End<public>():void = external {}