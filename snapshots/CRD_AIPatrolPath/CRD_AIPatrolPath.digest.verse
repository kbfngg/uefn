# Used to create patrolling behavior for guards spawned with the `guard_spawner_device`.
ai_patrol_path_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a guard reaches this device.
    NodeReachedEvent<public>:listenable(tuple()) = external {}

    # Signaled when a guard cannot reach the next `ai_patrol_path_device`.
    NextNodeUnreachableEvent<public>:listenable(tuple()) = external {}

    # Signaled when a guard starts moving on the patrol path.
    PatrolPathStartedEvent<public>:listenable(tuple()) = external {}

    # Signaled when a guard stops moving on the patrol path.
    PatrolPathStoppedEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Commands current patrollers to follow the *Next Patrol Path Group* instead of the default *Patrol Path Group*.
    GoToNextPatrolGroup<public>():void = external {}