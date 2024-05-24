using {/Verse.org/Simulation}
# Used to create plants with explosive pods that players can detonate and launch.
wilds_plant_device<public> := class<concrete><final>(creative_device_base):
    # Triggers whenever the plant grows.
    GrowEvent<public>:listenable(tuple()) = external {}

    # Triggers whenever the plant or launched projectile explodes.
    #  * Sends the `agent` that initially launched the projectile or triggered an immediate explosion.
    #  * Sends `false` if no `agent` is found.
    ExplodeEvent<public>:listenable(?agent) = external {}

    # Triggers whenever the plant launches a projectile.
    #  * Sends the `agent` that triggered this event.
    #  * Sends `false` if no `agent` is found.
    LaunchEvent<public>:listenable(?agent) = external {}

    # Enables the device to allow interaction and let it grow.
    Enable<public>():void = external {}

    # Disables the device to prevent interaction and growth.
    Disable<public>():void = external {}

    # Grows the plant if the device is enabled. If *Infinite Regrowths* is `false`, this is limited by *Maximum Regrowths*.
    Grow<public>():void = external {}

    # Detonates the plant if the device is enabled.
    Explode<public>():void = external {}

    # Sets whether the plant can always regrow after launching a projectile or being destroyed.
    SetInfiniteRegrowths<public>(InfiniteRegrowths:logic):void = external {}

    # Sets how many times the plant can regrow after launching a projectile or being destroyed.
    #  * This applies across the device’s entire lifetime and is unaffected by *Enable* and *Disable*.
    #  * This value is clamped.
    SetMaximumRegrowths<public>(MaximumRegrowths:int):void = external {}