using {/Fortnite.com/Vehicles}
using {/Verse.org/Simulation}
# Used to spawn customizable boxes containing vehicle mods. Hit a box with a vehicle to apply the mod.
vehicle_mod_box_spawner_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable the device and start the spawn timer. While enabled, it can spawn vehicle mod boxes, and those boxes can be interacted with.
    Enable<override>():void = external {}

    # Disable the device and clear any active spawn timer. While disabled, it will be hidden and vehicle mod boxes will not spawn.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Triggers whenever the mod box spawns.
    #  * Returns the index `int` of the chosen mod in the device's list, starting with `0` for Custom List Mod 1.
    # If *Possible Mods* is not set to `Custom List`, `int` will be `-1`.
    BoxSpawnedEvent<public>:listenable(int) = external {}

    # Triggers whenever the mod box is destroyed regardless of whether a mod was applied.
    # Returns tuple:
    #  * 0: The `agent` that triggered this event, if applicable.
    #  * 1: The index `int` of the chosen mod in the device's list, starting with `0` for Custom List Mod 1.
    # If *Possible Mods* is not set to `Custom List`, `int` will be `-1`.
    BoxDestroyedEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Triggers whenever the mod is applied to a vehicle.
    # Returns tuple:
    #  * 0: The `agent` driving the vehicle, if applicable.
    #  * 1: The `fort_vehicle` the mod applied to.
    #  * 2: The index `int` of the chosen mod in the device's list, starting with `0` for Custom List Mod 1.
    # If *Possible Mods* is not set to `Custom List`, `int` will be `-1`.
    ModAppliedEvent<public>:listenable(tuple(?agent, fort_vehicle, int)) = external {}

    # Triggers whenever the mod fails to apply to a vehicle.
    # Returns tuple:
    #  * 0: The `agent` driving the vehicle, if applicable.
    #  * 1: The `fort_vehicle` the mod failed to apply to.
    #  * 2: The index `int` of the chosen mod in the device's list, starting with `0` for Custom List Mod 1.
    # If *Possible Mods* is not set to `Custom List`, `int` will be `-1`.
    ModApplyFailedEvent<public>:listenable(tuple(?agent, fort_vehicle, int)) = external {}

    # If ModApplyEvent is overridden (see `SetOverrideModApplyEvent`), breaking a mod box triggers this instead of `ModApplyEvent` or `ModApplyFailEvent`.
    # Returns tuple:
    #  * 0: The `agent` driving the vehicle, if applicable.
    #  * 1: The `fort_vehicle` the mod would attempt to apply to.
    #  * 2: The index `int` of the chosen mod in the device's list, starting with `0` for Custom List Mod 1.
    # If *Possible Mods* is not set to `Custom List`, `int` will be `-1`.
    ModApplyOverriddenEvent<public>:listenable(tuple(?agent, fort_vehicle, int)) = external {}

    # Spawn a mod box if the device is enabled. If one is already spawned, spawn a new one without triggering `BoxDestroyEvent`.
    SpawnBox<public>():void = external {}

    # Despawn the box and clear the spawn timer without triggering `BoxDestroyEvent`. The respawn hologram will be visible, but will not progress without `StartSpawnTimer`. The device must be enabled.
    DespawnBox<public>():void = external {}

    # Check if this device currently has a spawned mod box.
    IsSpawned<public>()<transacts><decides>:void = external {}

    # Returns the number of times the device has spawned a mod box.
    GetSpawnCount<public>()<transacts>:int = external {}

    # Despawn the box if necessary without triggering `BoxDestroyEvent`, then start the spawn timer. The device must be enabled.
    StartSpawnTimer<public>():void = external {}

    # Returns the total length of the initial spawn timer in seconds, regardless of the timer's current state.
    GetInitialSpawnTimerLength<public>()<transacts>:float = external {}

    # Set the remaining time (in seconds) on the initial spawn timer (clamped to a minimum of `0.0`). The device must be enabled.
    #  * Even if the initial spawn timer is not currently active, this sets its length.
    SetInitialSpawnTimer<public>(Time:float):void = external {}

    # Returns the total length of the respawn timer in seconds, regardless of the timer's current state.
    GetRespawnTimerLength<public>()<transacts>:float = external {}

    # Set the remaining time (in seconds) on the respawn timer (clamped to a minimum of `0.0`). The device must be enabled.
    #  * This also sets the length of this device's future respawn timers.
    SetRespawnTimer<public>(Time:float):void = external {}

    # Returns the remaining time (in seconds) of the device's active spawn timer.
    #  * If there is no active timer, return `0.0`.
    GetActiveTimerRemaining<public>()<transacts>:float = external {}

    # Succeeds if *Possible Mods* is set to `Custom List`.
    GetUsingCustomList<epic_internal>()<transacts><decides>:void = external {}

    # Returns the current index `int` in the device's list of mod boxes. This value is set whenever the device spawns a new mod box.
    #  * The device's list starts with `0` for Custom List Mod 1.
    #  * If *Possible Mods* is not set to `Custom List` or the device has never spawned a mod box, `int` will be `-1`.
    GetCurrentIndex<public>()<transacts>:int = external {}

    # Succeeds if `Index` is a valid entry in the device's list. Fails if `Index` is an invalid entry or *Possible Mods* is not set to `Custom List`.
    IsValidIndex<public>(Index:int)<transacts><decides>:void = external {}

    # Spawn the same mod box this device spawned before the current one. If a mod box is already spawned, despawn that first without triggering `BoxDestroyEvent`.
    #  * Does nothing if this device is disabled or has not spawned more than one mod box.
    SpawnLastChosenMod<public>():void = external {}

    # If the mod box is spawned, respawn it as the previous valid entry in the list without triggering `BoxDestroyEvent`.
    #  * If the mod box is not spawned, that will be the next mod box.
    #  * The list wraps, which means the last index is considered directly before the first index.
    #  * Does nothing if this device is disabled or *Possible Mods* is not set to `Custom List`.
    CycleToPreviousValidIndex<public>():void = external {}

    # If the mod box is spawned, respawn it as the next valid entry in the list without triggering `BoxDestroyEvent`.
    #  * If the mod box is not spawned, that will be the next mod box.
    #  * The list wraps, which means the first index is considered directly after the last index.
    #  * Does nothing if this device is disabled or *Possible Mods* is not set to `Custom List`.
    CycleToNextValidIndex<public>():void = external {}

    # Set the next mod box to spawn to be the one at `Index` in the device's list.
    #  * The first index in the list is `0` for Custom List Mod 1.
    #  * Does nothing if this device is disabled, *Possible Mods* is not set to `Custom List`, or `Index` is invalid.
    SetNextModIndex<public>(Index:int):void = external {}

    # Spawn the mod box at `Index` in the device's list. If a mod box is already spawned, despawn that first without triggering `BoxDestroyEvent`.
    #  * The first index in the list is `0` for Custom List Mod 1.
    #  * Does nothing if this device is disabled, *Possible Mods* is not set to `Custom List`, or `Index` is invalid.
    SpawnModBoxByIndex<public>(Index:int):void = external {}

    # Apply the mod at `Index` in the device's list to the vehicle that `Agent` is riding.
    #  * The first index in the list is `0` for Custom List Mod 1.
    #  * Triggers `ModApplyEvent` and `ModApplyFailEvent` as appropriate, regardless of `SetOverrideModApplyEvent`.
    #  * Fails if this device is disabled, *Possible Mods* is not set to `Custom List`, `Index` or `Agent` is invalid, or `Agent` is not riding a vehicle.
    TryApplyModByAgent<public>(Index:int, Agent:agent)<transacts><decides>:void = external {}

    # Apply the mod at `Index` in the device's list to `Vehicle`.
    #  * The first index in the list is `0` for Custom List Mod 1.
    #  * Triggers `ModApplyEvent` and `ModApplyFailEvent` as appropriate, regardless of `SetOverrideModApplyEvent`.
    #  * Fails if this device is disabled, *Possible Mods* is not set to `Custom List`, or `Index` or `Vehicle` is invalid.
    #  * `Vehicle` must be an actual `fort_vehicle`. A vehicle spawner device will not be valid.
    #  * `ModApplyOverriddenEvent`, `ModApplyEvent`, and `ModApplyFailEvent` are a few ways to get a `fort_vehicle` value.
    TryApplyModByVehicle<public>(Index:int, Vehicle:fort_vehicle)<transacts><decides>:void = external {}

    # If `Override` is `true`, destroying the mod box with a vehicle will trigger `ModApplyOverriddenEvent` and a mod will not be applied.
    #  * In this case, destroying the mod box will not trigger `ModApplyEvent` or `ModApplyFailEvent`.
    #  * The values returned by `ModApplyOverriddenEvent` can be used for `TryApplyModByAgent` and `TryApplyModByVehicle`, so the event can be handled manually.
    #  * See `ModApplyOverriddenEvent` for more information.
    SetOverrideModApplyEvent<public>(Override:logic):void = external {}

    # Set this device's mod boxes to use the name 'Name'
    #  * The displayed name will not exceed 50 characters.
    #  * The following characters are disallowed: {, }, <, >, \, /, and |.
    SetCustomModBoxName<public>(Name:message):void = external {}

    # Reset the names of this device's mod boxes, if the name has been customized.
    ResetModBoxName<public>():void = external {}

    # Set the `Text` of the tooltip that appears when a player gets close to the mod box without a vehicle.
    #  * The displayed text will not exceed 50 characters.
    #  * The following characters are disallowed: {, }, <, >, \, /, and |.
    SetCustomPlayerTooltipText<public>(Text:message):void = external {}

    # Reset the text of the tooltip that appears when a player gets close to the mod box without a vehicle, if it's been customized.
    ResetPlayerTooltip<public>():void = external {}