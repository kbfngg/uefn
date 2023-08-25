# Used to regenerate an `agent`'s health and/or shields.
health_powerup_device<public> := class<concrete><final>(powerup_device):
    # Sets the *Magnitude* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    # For the Health Powerup, this is the amount of health or shield that the powerup will add or remove,
    SetMagnitude<public>(Magnitude:float):void = external {}

    # Returns the current *Magnitude* for the powerup.
    # For the Health Powerup, this is the amount of health or shield that the powerup will add or remove,
    GetMagnitude<public>()<transacts>:float = external {}