using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to configure a single interactive mannequin, that can visualize characters, clothing, and perform emotes.
character_device<public> := class<concrete>(creative_device_base):
    # Signaled when an `agent` interacts with this device.
    # Sends the `agent` that interacted with this device.
    InteractedWithEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Shows this device.
    Show<public>():void = external {}

    # Hides this device.
    Hide<public>():void = external {}

    # Plays an emote on the character created by this device.
    PlayEmote<public>():void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}