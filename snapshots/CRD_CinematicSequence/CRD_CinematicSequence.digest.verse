using {/Verse.org/Simulation}
# Used to trigger level sequences that allow coordination of cinematic animation, transformation, and audio tracks.
cinematic_sequence_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the sequence is stopped.
    StoppedEvent<public>:listenable(tuple()) = external {}

    # Plays the sequence. This will only work when the device is set to *Everyone*
    Play<public>():void = external {}

    # Plays the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Play<public>(Agent:agent):void = external {}

    # Stops the sequence.
    Stop<public>():void = external {}

    # Stops the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Stop<public>(Agent:agent):void = external {}

    # Go to the end and stop the sequence.
    GoToEndAndStop<public>():void = external {}

    # Go to the end and stop the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    GoToEndAndStop<public>(Agent:agent):void = external {}

    # Pauses the sequence.
    Pause<public>():void = external {}

    # Pauses the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Pause<public>(Agent:agent):void = external {}

    # Toggles between `Play` and `Stop`.
    TogglePause<public>():void = external {}

    # Toggles between `Play` and `Stop`. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    TogglePause<public>(Agent:agent):void = external {}

    # Set the playback position (in frames) of the sequence.
    SetPlaybackFrame<public>(PlaybackFrame:int):void = external {}

    # Returns the playback position (in frames) of the sequence.
    GetPlaybackFrame<public>()<transacts>:int = external {}

    # Set the playback position (in time/seconds) of the sequence.
    SetPlaybackTime<public>(PlaybackTime:float):void = external {}

    # Returns the playback position (in time/seconds) of the sequence.
    GetPlaybackTime<public>()<transacts>:float = external {}

    # Set the playback rate of the sequence.
    SetPlayRate<public>(PlayRate:float):void = external {}

    # Returns the playback rate of the sequence.
    GetPlayRate<public>()<transacts>:float = external {}