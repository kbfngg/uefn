using {/Verse.org/Simulation}
# Used to spawn guards that can patrol and attack other `agent`s.
guard_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a guard is spawned. Sends the `agent` guard who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when a guard has identified an opponent. `Source` is the guard who is aware. `Target` is the agent who alerted the guard.
    AlertedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard has lost track of a target. `Source` is the guard that lost track of a target. `Target` is the `agent` no longer targeted by the guard.
    TargetLostEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard becomes suspicious. Sends the `agent` guard who is suspicious.
    SuspiciousEvent<public>:listenable(agent) = external {}

    # Signaled when a guard becomes unaware. Sends the `agent` guard who is unaware.
    UnawareEvent<public>:listenable(agent) = external {}

    # Signaled when guard is damaged. `Source` is the `agent` that damaged the guard. If the guard was damaged by a non-agent then `false` is returned. `Target` is the guard that was damaged.
    DamagedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is eliminated. `Source` is the `agent` that eliminated the guard. If the guard was eliminated by a non-agent then `Source` is 'false'. `Target` is the guard that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard eliminates an agent. `Source` is the guard that eliminated the agent. `Target` is the agent that was eliminated.
    EliminatingEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is hired by a player. `Source` is the `agent` who hired the guard. `Target` is the guard that was hired.
    HiredEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is dismissed by a player. `Source` is the `agent` who dismissed the guard. `Target` is the guard that was dismissed.
    DismissedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device. Guards will start to spawn.
    Enable<public>():void = external {}

    # Disables this device. Guards will despawn if *Despawn Guards When Disabled* is set.
    Disable<public>():void = external {}

    # Resets the spawn count allowing spawning of a new batch of guards.
    Reset<public>():void = external {}

    # Tries to spawn a guard.
    Spawn<public>():void = external {}

    # Tries to spawn a guard. If *Auto Hire When Spawned* is set to *Triggering Player* the guard will be hired by `Instigator`.
    Spawn<public>(Instigator:agent):void = external {}

    # Despawns guards.
    Despawn<public>():void = external {}

    # Despawns guards. `Instigator` will be considered as the eliminator of those guards.
    Despawn<public>(Instigator:agent):void = external {}

    # Hires guards to `Instigator`'s team.
    Hire<public>(Instigator:agent):void = external {}

    # Dismisses all hired guards.
    DismissAllHiredGuards<public>():void = external {}

    # Dismisses all hired guards that were recruited by `Instigator`.
    DismissAgentHiredGuards<public>(Instigator:agent):void = external {}

    # Forces guards to attack `Target`, bypassing perception checks. 'ForgetTime' ranges from 0.0 to 600.0 (in seconds, default is 600.0), it is the time after which the target will be ignored if not found. 'ForgetDistance' ranges from 0.0 to 100000.0 (in centimeters, default is 100000.0), it is the distance at which the target will be ignored if not found.
    ForceAttackTarget<public>(Target:agent, ?ForgetTime:float = external {}, ?ForgetDistance:float = external {}):void = external {}

    # Allows guards to be hired.
    SetGuardsHireable<public>():void = external {}

    # Prevents guards from being hired.
    SetGuardsNotHireable<public>():void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>:int = external {}