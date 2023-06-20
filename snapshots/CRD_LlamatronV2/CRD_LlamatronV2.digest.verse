using {/Verse.org/Simulation}
# Used to display curated videos onto in-game screens or player HUDs.
video_player_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device becomes the controlling streaming device for the `agent`.
    StreamStartedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Enables collision checks on this device.
    EnableCollision<public>():void = external {}

    # Disables collision checks on this device.
    DisableCollision<public>():void = external {}

    # Transitions to fullscreen for `Agent`.
    EnterFullScreen<public>(Agent:agent):void = external {}

    # Transitions to fullscreen for `Agent`.
    ExitFullScreen<public>(Agent:agent):void = external {}

    # Hides the picture-in-picture video from `Agent`.
    HidePIP<public>(Agent:agent):void = external {}

    # Transitions the picture-in-picture video to the default size for `Agent`.
    MakePIPDefaultSize<public>(Agent:agent):void = external {}

    # Transitions the picture-in-picture video to full screen for `Agent`.
    MakePIPFullScreen<public>(Agent:agent):void = external {}

    # Turns off all streaming devices of this type on the island.
    EndForAll<public>():void = external {}

    # Restart the stream from the beginning.
    Restart<public>():void = external {}

    # Seeks to the *Triggered Seek Time*. Caution: The stream will pause while the video buffers when seeking.
    Seek<public>():void = external {}

    # Stops the currently playing stream and starts the custom stream with the audio only playingfrom this device. *Stream Priority* will not work until control is released.
    TakeControl<public>():void = external {}

    # If any streaming device has forced control of the stream, this will release it and play the highestpriority stream in line.
    ReleaseControl<public>():void = external {}