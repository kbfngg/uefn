using {/UnrealEngine.com/Temporary/SpatialMath}
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

    # Pauses the sequence.
    Pause<public>():void = external {}

    # Pauses the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Pause<public>(Agent:agent):void = external {}

    # Toggles between `Play` and `Stop`.
    TogglePause<public>():void = external {}

    # Toggles between `Play` and `Stop`. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    TogglePause<public>(Agent:agent):void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}