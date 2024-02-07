using {/Verse.org/Simulation}
# Used to create a customizable turret that can search for nearby targets.
automated_turret_device<public> := class<concrete><final>(creative_device_base):
    # Triggers when someone enters the activation radius while nobody else is there.
    # Sends the activating `agent`. If the activator is a non-agent then `false` is returned.
    ActivatedEvent<public>:listenable(?agent) = external {}

    # Triggers when the turret is damaged.
    # Sends the triggering `agent`. If the activator is a non-agent then `false` is returned.
    DamagedEvent<public>:listenable(?agent) = external {}

    # Triggers when the turret is destroyed.
    # Sends the triggering `agent`. If the activator is a non-agent then `false` is returned.
    DestroyedEvent<public>:listenable(?agent) = external {}

    # Triggers when the turret finds a target.
    # Sends the `agent` that was found.
    TargetFoundEvent<public>:listenable(agent) = external {}

    # Triggers when the turret loses a target.
    # Sends the `agent` that was lost.
    TargetLostEvent<public>:listenable(agent) = external {}

    # Enables the turret to rotate, target, and track.
    Enable<public>():void = external {}

    # Disables the turret, causing it to close and ignore its activation radius.
    Disable<public>():void = external {}

    # Set the turret to the Default Team.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    UseDefaultTeam<public>():void = external {}

    # Set the turret to the Wildlife & Creatures team.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    UseTeamWildlifeAndCreatures<public>():void = external {}

    # Set the turret to the team with the chosen index number.
    #  * `TeamIndex` is clamped to valid team values, with a minimum of `1`.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    SetTeam<epic_internal>(TeamIndex:int):void = external {}

    # Set the turret to the same team as the supplied `Agent`.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    SetTeam<public>(Agent:agent):void = external {}

    # Set the supplied `Agent` as the turret's target.
    #  * The target will only change if `Agent` is within the activation radius, has direct line-of-sight to the turret,
    # is on a targetable team as determined by `Possible Targets`, and is not Down But Not Out.
    SetTarget<public>(Agent:agent):void = external {}