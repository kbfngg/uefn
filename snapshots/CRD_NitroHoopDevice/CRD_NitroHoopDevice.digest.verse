using {/Verse.org/Simulation}
# Use to create a flaming hoop that accelerates and applies nitro to players and vehicles.
nitro_hoop_device<public> := class<concrete><final>(creative_device_base):
    # Triggers when a player triggers the device.
    # Sends the triggering `agent`.
    PlayerTriggeredEvent<public>:listenable(agent) = external {}

    # Triggers when a vehicle triggers the device.
    # Sends the driver as the triggering `agent`. If the vehicle has no driver then `false` is returned.
    VehicleTriggeredEvent<public>:listenable(?agent) = external {}

    # Triggers when the device enters the cooldown state, becoming disabled.
    # This is not triggered by manually calling `Disable`.
    CooldownStartEvent<public>:listenable(tuple()) = external {}

    # Triggers when the device becomes enabled after being disabled, potentially through the cooldown state.
    EnabledEvent<public>:listenable(tuple()) = external {}

    # Enable the device. If the device is currently in the cooldown state, this also ends the cooldown state.
    Enable<public>():void = external {}

    # Disable the device. This causes the device to enter the cooldown state until the device is re-enabled by `Enable`, `DisallowCooldown`, or `Enable on Phase`.
    Disable<public>():void = external {}

    # Allow the device to enter the cooldown state after a player or vehicle triggers it.
    AllowCooldown<public>():void = external {}

    # Prevent the device from entering the cooldown state after use. Until `AllowCooldown` is called, triggering the device will not begin cooldown.
    # If the device is currently in the cooldown state, this ends the cooldown state and re-enables the device.
    DisallowCooldown<public>():void = external {}

    # Enter the cooldown state for `Seconds` seconds. If the device is already in the cooldown state, re-enable it after `Seconds` seconds.
    # `Seconds` is clamped to a minimum of `1.0`.
    StartCooldown<public>(Seconds:float):void = external {}

    # Succeeds if the device is currently enabled.
    # The device is not enabled if it is in the cooldown state, or has otherwise been manually disabled.
    IsEnabled<public>()<transacts><decides>:void = external {}

    # Return the default duration of the cooldown state in seconds.
    GetDefaultCooldownDuration<public>():float = external {}

    # Set the default duration of the cooldown state to `Seconds`.
    #  * `Seconds` is clamped between `1.0` and `60.0`.
    SetDefaultCooldownDuration<public>(Seconds:float):void = external {}