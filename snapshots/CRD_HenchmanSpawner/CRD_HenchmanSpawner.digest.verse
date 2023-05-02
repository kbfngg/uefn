using {/Verse.org/Simulation}
# Used to spawn guards that can patrol and attack other `agent`s.
guard_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a guard is spawned.
    # Sends the `agent` guard who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Enables this device. Guards will start to spawn.
    Enable<public>():void = external {}

    # Disables this device. Guards will despawn if *Despawn Guards When Disabled* is set.
    Disable<public>():void = external {}

    # Resets the spawn count allowing spawning of a new batch of guards.
    Reset<public>():void = external {}

    # Tries to spawn a guard. If *Auto Hire When Spawned* is set to *Triggering Player* the guard will be
    # hired by `Instigator`.
    Spawn<public>(Instigator:agent):void = external {}

    # Despawns guards. `Instigator` will be considered as the eliminator of those guards.
    Despawn<public>(Instigator:agent):void = external {}

    # Hires guards to `Instigator`'s team.
    Hire<public>(Instigator:agent):void = external {}

    # Dismisses all hired guards.
    DismissAllHiredGuards<public>():void = external {}

    # Dismisses all hired guards that were recruited by `Instigator`.
    DismissAgentHiredGuards<public>(Instigator:agent):void = external {}

    # Forces guard to attack `Target`, bypassing perception checks.
    ForceAttackTarget<public>(Target:agent):void = external {}

    # Allows guards to be hired.
    SetGuardsHireable<public>():void = external {}

    # Prevents guards from being hired.
    SetGuardsNotHireable<public>():void = external {}