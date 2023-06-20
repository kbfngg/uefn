using {/Verse.org/Simulation}
# Used to spawn and configure an aerial supply drop that can provide players with customized weapons/supplies.
supply_drop_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the balloon on the supply crate is popped.Sends the `?agent` that popped the balloon. If no `agent` popped the balloonreturns `false`.
    BalloonPoppedEvent<public>:listenable(?agent) = external {}

    # Signaled when the supply crate is opened.Sends the `agent` that opened the crate.
    OpenedEvent<public>:listenable(agent) = external {}

    # Signaled when the supply crate lands for the first time.
    LandingEvent<public>:listenable(tuple()) = external {}

    # Spawns a supply drop provided one hasn't already spawned. *Owning Team* is set to `Agent`'s team.
    Spawn<public>(Agent:agent):void = external {}

    # Spawns a supply drop provided one hasn't already spawned.
    Spawn<public>():void = external {}

    # Destroys the balloon and causes the supply crate to freefall.
    DestroyBalloon<public>():void = external {}

    # Opens the supply crate, ignoring the locked or unlocked state. `Agent` acts as the instigator of the open action.
    Open<public>(Agent:agent):void = external {}

    # Locks the supply crate so `agent`s cannot open it.
    Lock<public>():void = external {}

    # Unlocks the supply crate so `agent`s can open it.
    Unlock<public>():void = external {}