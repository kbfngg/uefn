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
    SetTeam<override>(TeamIndex:int):void = external {}

    # Set the turret to the same team as the supplied `Agent`.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    SetTeam<public>(Agent:agent):void = external {}

    # Returns the `agent` currently targeted by the device.
    GetTarget<epic_internal>():?agent = external {}

    # Set the supplied `Agent` as the turret's target.
    #  * The target will only change if `Agent` is within the activation radius, has direct line-of-sight to the turret,
    # is on a targetable team as determined by `Possible Targets`, and is not Down But Not Out.
    SetTarget<public>(Agent:agent):void = external {}

    # Clears the turret's current target and returns the turret to searching for targets.
    #  * If the current target is still in range, it'll likely be the best target, and will be reacquired.
    #  * Combine with disabled targeting for best results.
    ClearTarget<epic_internal>():void = external {}

    # Sets the amount of damage the turret will do per shot to targets to `Damage`.
    SetDamage<epic_internal>(Damage:float):void = external {}

    # Sets the range in meters at which the turret will activate to `Range`.
    # This is clamped between `2.0` and `100.0` meters.
    SetActivationRange<epic_internal>(Range:float):void = external {}

    # Sets the range in meters at which the turret will target to `Range`.
    # This is clamped between `2.0` and `100.0` meters. Setting it lower than 2m will disable Targeting.
    SetTargetRange<epic_internal>(Range:float):void = external {}