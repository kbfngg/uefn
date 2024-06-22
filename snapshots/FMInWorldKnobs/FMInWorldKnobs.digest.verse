# Base class for all Patchwork devices.
patchwork_device<public> := class<concrete>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}