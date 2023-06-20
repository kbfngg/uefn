using {/Verse.org/Simulation}
# Used to spawn various wildlife that players can herd, hunt, or tame.
wildlife_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device spawns wildlife. Sends the `agent` wildlife that was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when wildlife is eliminated. `Source` is the `agent` that eliminated the wildlife. If the wildlife was eliminated by a non-agent then `Source` is 'false'. `Target` is the wildlife that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a wildlife eliminates an agent. `Source` is the wildlife that eliminated the agent. `Target` is the agent that was eliminated.
    EliminatingEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife is tamed. `Source` is the `agent` that tamed the wildlife. `Target` is the wildlife that was tamed.
    TamedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife is untamed. `Source` is the `agent` that tamed the wildlife. `Target` is the wildlife that was untamed.
    UntamedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife is force-spawned and causes the oldest wildlife to be eliminated. Sends the `agent` wildlife that was spawned.
    ForceSpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when wildlife is damaged. `Source` is the `agent` that damaged the wildlife. If the wildlife was damaged by a non-agent then `false` is returned. `Target` is the wildlife that was damaged.
    DamagedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife eats a pickup such as a Shroom or Meat. Sends the wildlife that ate something.
    SomethingIsEatenEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` rides wildlife. `Source` is the `agent` that started riding the wildlife. `Target` is the wildlife that was ridden.
    RiddenEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when an `agent` dismounts wildlife. `Source` is the `agent` that dismounted the wildlife. `Target` is the wildlife that was dismounted.
    DismountedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the count on the *Total Spawn Count* option.
    Reset<public>():void = external {}

    # Spawns wildlife from this device.
    Spawn<public>():void = external {}

    # Despawns wildlife. `Agent` is marked as the one who eliminated the wildlife.
    Despawn<public>(Agent:agent):void = external {}

    # Destroys this device, marking `Agent` as the destroyer of the device.
    DestroySpawner<public>(Agent:agent):void = external {}

    # Tames wildlife, making them AI partners of `Agent`.
    Tame<public>(Agent:agent):void = external {}

    # Untames any tamed wildlife that belong to `Agent`.
    Untame<public>(Agent:agent):void = external {}

    # Untames all wildlife.
    UntameAll<public>():void = external {}

    # Teleports `Agent` to the nearest wildlife, then `Agent` mounts that wildlife.
    Ride<public>(Agent:agent):void = external {}

    # Dismounts `Agent` from wildlife.
    Dismount<public>(Agent:agent):void = external {}

    # Dismounts all `agent`s from wildlife.
    DismountAll<public>():void = external {}

    # Restores energy to wildlife belonging to `Agent` by *Energy Restore Amount*.
    RestoreEnergy<public>(Agent:agent):void = external {}

    # Restores energy to wildlife by *Energy Restore Amount*.
    RestoreEnergyForAll<public>():void = external {}

    # Consumes energy from wildlife belonging to `Agent` by *Energy Consume Amount*.
    ConsumeEnergy<public>(Agent:agent):void = external {}

    # Consumes energy from wildlife by *Energy Consume Amount*.
    ConsumeEnergyForAll<public>():void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>:int = external {}