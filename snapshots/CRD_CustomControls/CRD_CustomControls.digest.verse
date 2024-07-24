using {/Verse.org/Simulation}
# Used to update the gameplay controls scheme based on current control mode.
gameplay_controls_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Adds the gameplay control to the `Player`’s gameplay controls stack and pushes it to be the active control.
    AddTo<public>(Agent:agent):void = external {}

    # Adds the gameplay control to all `Agent`s gameplay controls stack and pushes it to be the active control.
    AddToAll<public>():void = external {}

    # Removes the gameplay control from the `Agent`’s gameplay controls stack and pops from being the active control replacing it with the next one in the stack.
    RemoveFrom<public>(Agent:agent):void = external {}

    # Removes the gameplay control from all `Agent`s gameplay controls stack and pops from being the active control replacing it with the next one in the stack.
    RemoveFromAll<public>():void = external {}

# Used to adapt the controls to side scroller functionality
gameplay_controls_side_scroller_device<public> := class<concrete><final>(gameplay_controls_device):


# Used to adapt the controls to the camera perspective
gameplay_controls_third_person_device<public> := class<concrete><final>(gameplay_controls_device):
