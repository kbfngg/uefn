using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to project a hologram of a character performing dance emotes.
dance_mannequin_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates the hologram using *Default Preset* options.
    ActivateDefaultPreset<public>():void = external {}

    # Activates the hologram using *Preset 2* options.
    ActivatePreset2<public>():void = external {}

    # Activates the hologram using *Preset 3* options.
    ActivatePreset3<public>():void = external {}

    # Activates the hologram using `Agent`'s skin and emotes.
    ActivateSkinAndEmoteCapture<public>(Agent:agent):void = external {}

    # Deactivates the hologram.
    DeactivateSkinAndEmoteCapture<public>():void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}