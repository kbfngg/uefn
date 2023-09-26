# Used to create a light which can have its color and brightness manipulated in response to in-game events.
customizable_light_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the light to its initial state.
    Reset<public>():void = external {}

    # Turns on the light.
    TurnOn<public>():void = external {}

    # Turns off the light.
    TurnOff<public>():void = external {}

    # Toggles between `TurnOn` and `TurnOff`.
    Toggle<public>():void = external {}

    # Dims the light by *Dimming Amount*.
    DimLight<public>():void = external {}

    # Brightens the light by *Dimming Amount*.
    UndimLight<public>():void = external {}