using {/Verse.org/Simulation}
# Used to customize (or prevent) the 'down but not out' player state between 'healthy' and 'removed from game'.
down_but_not_out_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` is set to the `down but not out` player state.
    # Sends the `agent` that was downed.
    AgentDownedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is picked up.
    # Sends the `agent` that was picked up.
    AgentPickedUpEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is dropped.
    # Sends the `agent` that was dropped.
    AgentDroppedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is thrown.
    # Sends the `agent` that was thrown.
    AgentThrownEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is revived.
    # Sends the `agent` that was revived.
    AgentRevivedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` is the aggressor of a shake down.
    # Sends the `agent` that is the aggressor.
    ShakeDownEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` is the victim of a shake down.
    # Sends the `agent` that is the victim.
    ShakenDownEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Sets the `Agent` to the `down but not out` player state.
    Down<public>(Agent:agent):void = external {}

    # Sets the `Agent` to the `healthy` player state if they are in the `down but not out` player state.
    Revive<public>(Agent:agent):void = external {}