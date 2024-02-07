using {/Verse.org/Simulation}
# Used to play streamed music.
streaming_radio_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Starts playing audio for `Agent`.
    Play<public>(Agent:agent):void = external {}

    # Stops playing audio for `Agent`.
    Stop<public>(Agent:agent):void = external {}

    # Changes audio channel for `Agent`.
    ChangeChannel<public>(Agent:agent):void = external {}