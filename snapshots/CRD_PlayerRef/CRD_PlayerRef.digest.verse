using {/Verse.org/Simulation}
# Used to relay `agent` statistics to other devices and `agent`s. Can transmit statistics such as elimination count,
# eliminated count, or scores when certain conditions are met. Can also project a hologram of the `agent` and display text
# that can be altered in various positions and curvatures.
player_reference_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is activated.
    # Sends the `agent` stored in the device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Signaled when a stat tracked by this device is updated.
    # Sends the `agent` stored in the device.
    TrackedStatChangedEvent<public>:listenable(agent) = external {}

    # Signaled when the `agent` tracked by this device is updated.
    # Sends the new `agent` stored in the device.
    AgentUpdatedEvent<public>:listenable(agent) = external {}

    # Signaled when the `agent` tracked by this fails to be updated.
    # Sends the `agent` that attempted to be stored in this device.
    AgentUpdateFailsEvent<public>:listenable(agent) = external {}

    # Signaled when the `agent` tracked by this device is replaced.
    # Sends the new `agent` stored in the device.
    AgentReplacedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Ends the round/game.
    Activate<public>():void = external {}

    # Registers `Agent` as the `agent` being tracked by this device.
    Register<public>(Agent:agent):void = external {}

    # Clears the state of this device.
    Clear<public>():void = external {}