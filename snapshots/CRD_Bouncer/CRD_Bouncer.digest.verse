using {/Verse.org/Simulation}
# Used to create a bouncer that can launch players, vehicles, and more into the air with optional effects.
bouncer_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the condition in the *On Bounced Trigger* option is met and someone or something is launched. * Sends the `agent` that bounced. If a vehicle bounced, sends the driver. If a projectile bounced, sends its instigator. * Sends `false` if something else bounced, including a vehicle with no driver
    BouncedEvent<public>:listenable(?agent) = external {}

    # Signaled when the heal effect starts for an `agent`.
    HealStartEvent<public>:listenable(agent) = external {}

    # Signaled when the heal effect stops for an `agent`.
    HealStopEvent<public>:listenable(agent) = external {}

    # Enables bouncing on this device, as well as any visual and audio effects.
    Enable<public>():void = external {}

    # Disables bouncing on this device, as well as any visual and audio effects.
    Disable<public>():void = external {}