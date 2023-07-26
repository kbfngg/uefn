using {/UnrealEngine.com/Temporary/SpatialMath}
# Allows players to change their outfit in game!
changing_booth_device<public> := class<concrete><final>(creative_device_base):
    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}