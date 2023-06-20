using {/Verse.org/Simulation}
# Used to spawn fireflies that can be collected by `agent`s.
firefly_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a firefly is collected.Sends the `agent` collected the firefly.
    OnFirefliesCollected<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Spawns new fireflies. The previous fireflies will be destroyed before a new fireflies spawn.
    Respawn<public>():void = external {}

    # Resets respawn count.
    ResetRespawnCount<public>():void = external {}