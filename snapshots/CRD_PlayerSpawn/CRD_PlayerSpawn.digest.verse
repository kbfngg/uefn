using {/Verse.org/Simulation}
# Used to spawn an `agent` on an island. Use multiple `player_spawner_device`s to spawn multiple `agent`s.
player_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` is spawned from this device.
    # Sends the `agent` that spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}