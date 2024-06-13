# Physics boulder that can be dislodged and damage `agent`s, vehicles, creatures, and structures.
physics_boulder_device<public> := class<concrete><final>(physics_object_base_device):
    # Signaled when the balanced boulder is spawned on the base.
    BalancedBoulderSpawnedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the balanced boulder is destroyed.
    BalancedBoulderDestroyedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the base of the boulder is destroyed.
    BaseDestroyedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the rolling boulder is destroyed.
    RollingBoulderDestroyedEvent<public>:listenable(tuple()) = external {}

    # Destroys the boulder's base.
    DestroyBase<public>():void = external {}

    # Releases the boulder sitting on the base, if there is one.
    ReleaseRollingBoulder<public>():void = external {}

    # Destroys the current rolling boulder.
    DestroyRollingBoulder<public>():void = external {}

# Base class for various physics-based gameplay elements (e.g. boulders/trees).
physics_object_base_device<public> := class<abstract><epic_internal>(prop_spawner_base_device):


# Physics tree that can be chopped down, and damage players, vehicles, creatures, and structures.
physics_tree_device<public> := class<concrete><final>(physics_object_base_device):
    # Signaled when a tree is spawned.
    TreeSpawnedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the log created by a tree is destroyed.
    LogDestroyedEvent<public>:listenable(tuple()) = external {}

    # Signaled when the stump created by a tree is destroyed.
    StumpDestroyedEvent<public>:listenable(tuple()) = external {}

    # Signaled when a tree has taken enough damage to be knocked down.
    TreeKnockedDownEvent<public>:listenable(tuple()) = external {}

    # Releases the log from the tree, if there is one.
    ReleaseLog<public>():void = external {}

    # Destroys the current log.
    DestroyLog<public>():void = external {}

    # Destroys the current stump.
    DestroyStump<public>():void = external {}