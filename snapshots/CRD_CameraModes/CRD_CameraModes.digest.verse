using {/Verse.org/Simulation}
# Used to update the camera’s current viewpoint and rotation based on a fixed angle.
gameplay_camera_fixed_angle_device<public> := class<concrete><final>(gameplay_camera_device):


# Used to update the camera’s current viewpoint and rotation based on a fixed point.
gameplay_camera_fixed_point_device<public> := class<concrete><final>(gameplay_camera_device):


# Used to update the camera’s current viewpoint and rotation based on current camera mode.
gameplay_camera_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Adds the camera to the `Agent`’s camera stack and pushes it to be the active camera.
    AddTo<public>(Agent:agent):void = external {}

    # Adds the camera to all `Agent`s camera stacks and pushes it to be the active camera.
    AddToAll<public>():void = external {}

    # Removes the camera from the `Agent`’s camera stack and pops from being the active camera replacing it with the next one in the stack.
    RemoveFrom<public>(Agent:agent):void = external {}

    # Removes the camera from all `Agent`s camera stacks and pops from being the active camera replacing it with the next one in the stack.
    RemoveFromAll<public>():void = external {}