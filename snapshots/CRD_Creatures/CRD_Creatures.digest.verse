using {/Verse.org/Simulation}
# Used to spawn one or more waves of creatures of customizable types at selected time intervals.
creature_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a creature is spawned.
    # Sends the `agent` creature who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when a creature is eliminated.
    #  `Source` is the `agent` that has eliminated the creature. If the creature was eliminated by a non-agent then `Source` is 'false'.
    #  `Target` is the creature that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Destroys this device.
    DestroySpawner<public>():void = external {}

    # Eliminates all creatures spawned by this device.
    EliminateCreatures<public>():void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>:int = external {}

# Used to spawn a creature at a specified location.
creature_placer_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a creature is spawned.
    # Sends the `agent` creature who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when the creature is eliminated.
    #  * Sends the `agent` that eliminated the creature.
    #  * Sends `false` if the creature was eliminated by something other than an `agent` (e.g. a vehicle).
    EliminatedEvent<public>:listenable(?agent) = external {}

    # Spawns the creature.
    Spawn<public>():void = external {}

    # Despawns the creature.
    Despawn<public>():void = external {}

# Used to customize one creature type at a time. Place multiple `creature_manager_device`s for each type of creature on your island.
creature_manager_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a creature of the selected *Creature Type* is eliminated.
    # Sends the `agent` that eliminated the creature.
    MatchingCreatureTypeEliminatedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}