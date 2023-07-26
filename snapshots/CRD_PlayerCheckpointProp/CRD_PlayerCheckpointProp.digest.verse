using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to set an `agent`'s spawn point when activated. This can also clear the `agent`'s inventory.
player_checkpoint_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is first activated by any `agent`.
    # Sends the `agent` that activated this device.
    FirstActivationEvent<public>:listenable(agent) = external {}

    # Signaled each time a new `agent` activates this device.
    # Sends the `agent` that activated this device.
    FirstActivationPerAgentEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Registers this checkpoint for `Agent`. This sets the respawn point and can clear `Agent`'s inventory depending on this device's settings. Multiple `agent`s can be registered to this device at one time.
    Register<public>(Agent:agent):void = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}