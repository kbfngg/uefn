using {/Verse.org/Simulation}
# Used to create an environmental prop that applies Nitro to those around it when it is destroyed.
nitro_barrel_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Triggers when an `agent` launches the barrel. Sends the launching `agent`.If the launcher is a non-agent, sends `false`.
    LaunchedEvent<public>:listenable(?agent) = external {}

    # Triggers when the barrel explodes after being launched. Sends the launching `agent`.If the launcher is a non-agent, sends `false`.
    ExplodedEvent<public>:listenable(?agent) = external {}

    # Enables and shows the barrel.Enabling the device when it's disabled will spawn a new barrel.
    Enable<public>():void = external {}

    # Disables and hides the barrel.Disabling the device will remove an existing barrel and reset the respawn delay.
    Disable<public>():void = external {}

    # Succeeds if the barrel is enabled and visible.
    IsEnabled<public>()<transacts><decides>:void = external {}

    # Sets the multiplier applied to the force used when launching.This is clamped between `0.25` and `2.0`.
    SetLaunchForceMultiplier<public>(LaunchForceMultiplier:float):void = external {}

    # Returns the force multiplier to launch the barrel.
    GetLaunchForceMultiplier<public>():float = external {}

    # Allows the barrel to respawn after it explodes, waiting *RespawnDelay* seconds.
    AllowRespawn<public>():void = external {}

    # Prevents the barrel from respawning.The *RespawnDelay* countdown will not start. If the countdown has already started, the barrel will not respawn when it ends.
    DisallowRespawn<public>():void = external {}

    # Succeeds if the barrel has respawn allowed.
    IsRespawnAllowed<public>()<transacts><decides>:void = external {}

    # Sets the delay time to respawn the barrel, clamped between `0.0` and `1000.0` seconds.This will override the delay timer if set during the delay countdown.
    SetRespawnDelay<public>(RespawnDelay:float):void = external {}

    # Returns the delay between exploding and respawning (if allowed), in seconds.
    GetRespawnDelay<public>():float = external {}