using {/Verse.org/Simulation}
# Used to trigger a custom response to a *Primary* or *Secondary* signal, sent by a *Signal Remote* item.
signal_remote_manager_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a player has triggered the *Primary* signal using a *Signal Remote* item.
    # Sends the `agent` that triggered the signal.
    PrimarySignalEvent<public>:listenable(agent) = external {}

    # Signaled when a player has triggered the *Secondary* signal using a *Signal Remote* item.
    # Sends the `agent` that triggered the signal.
    SecondarySignalEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}