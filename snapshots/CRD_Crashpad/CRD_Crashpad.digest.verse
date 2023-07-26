using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to place a crash pad that can bounce players and protect them from fall damage.
crash_pad_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` is launched by this device.
    # Sends the launched `agent`.
    LaunchedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}