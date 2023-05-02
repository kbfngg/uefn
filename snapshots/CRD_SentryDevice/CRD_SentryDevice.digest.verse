using {/Verse.org/Simulation}
# Generates an AI bot that spawns in a location and usually attacks players when they come in range.
sentry_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the sentry is alerted to an `agent`.
    # Sends the `agent` who alerted the sentry.
    AlertedEvent<public>:listenable(agent) = external {}

    # Signaled when the sentry exists the alert state.
    ExitsAlertEvent<public>:listenable(tuple()) = external {}

    # Signaled when the sentry enters the alert state.
    EntersAlertCooldownEvent<public>:listenable(tuple()) = external {}

    # Signaled when a sentry attacks an `agent`.
    # Sends the `agent` who is being attacked.
    AttackingEvent<public>:listenable(agent) = external {}

    # Signaled when a sentry is eliminated.
    # Sends the `agent` that eliminated the sentry. If the sentry was eliminated by a non-agent
    # then `false` is returned.
    EliminatedEvent<public>:listenable(?agent) = external {}

    # Signaled when the sentry eliminates a creature.
    EliminatingACreatureEvent<public>:listenable(tuple()) = external {}

    # Signaled when a sentry eliminates an `agent`.
    # Sends the `agent` who was eliminated by the sentry.
    EliminatingAgentEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Spawns the sentry.
    Spawn<public>():void = external {}

    # Destroys the current sentry.
    DestroySentry<public>():void = external {}

    # Sets the sentry to the same team `Agent` is on.
    JoinTeam<public>(Agent:agent):void = external {}

    # Resets the sentry to the original team desiganted in the device options.
    ResetTeam<public>():void = external {}

    # Puts the sentry into the pacify state, preventing from entering the alert (attacking) state.
    Pacify<public>():void = external {}

    # Puts the sentry into the alert state.
    EnableAlert<public>():void = external {}

    # Sets the sentry to target `Agent`. The sentry will not target agents on the same team as the sentry.
    Target<public>(Agent:agent):void = external {}

    # Resets the alert state.
    ResetAlertCooldown<public>():void = external {}