using {/Verse.org/Simulation}
# Used to configure and play audio from the device location or from registered `agent`s.
audio_player_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device. Allows this device to be triggered from other linked devices (i.e. triggers) and allow calls to `Play` to succeed.
    Enable<public>():void = external {}

    # Disables this device. No longer allows this device to be triggered from other linked devices (i.e. triggers) and will stop any currently playing audio.
    Disable<public>():void = external {}

    # Starts playing audio from this device for `Agent`. This can only be used when the device is set to be *Heard by Instigator*.
    Play<public>(Agent:agent):void = external {}

    # Starts playing audio from this device.
    Play<public>():void = external {}

    # Stops any audio playing from this device for `Agent`. This can only be used when the device is set to be *Heard by Instigator*.
    Stop<public>(Agent:agent):void = external {}

    # Stops any audio playing from this device.
    Stop<public>():void = external {}

    # Adds `Agent` as a target to play audio from when activated.
    Register<public>(Agent:agent):void = external {}

    # Removes `Agent` as a target to play audio from when activated.
    Unregister<public>(Agent:agent):void = external {}

    # Removes all previously registered `agent`s as valid targets to play audio from when activated.
    UnregisterAll<public>():void = external {}

    # Shows this device in the world.
    Show<public>()<transacts>:void = external {}

    # Hides this device from the world.
    Hide<public>()<transacts>:void = external {}