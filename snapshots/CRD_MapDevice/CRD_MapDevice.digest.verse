using {/Verse.org/Simulation}
# Used to control the behavior of the map & minimap.
map_controller_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Activates the map for the provided `Agent`.
    Activate<epic_internal>(Agent:agent):void = external {}

    # Activates the map for all `agent`s in the experience.
    Activate<epic_internal>():void = external {}

    # Deactivates the map for the provided `Agent`.
    Deactivate<epic_internal>(Agent:agent):void = external {}

    # Deactivates the map for all `agent`s in the experience.
    Deactivate<epic_internal>():void = external {}

    # Enables the device.
    Enable<epic_internal>():void = external {}

    # Disables the device.
    Disable<epic_internal>():void = external {}

    # Sets the *Capture Box Size*.
    # Value is clamped between `5.0` and `500.0`.
    SetCaptureBoxSize<epic_internal>(Size:float):void = external {}

    # Returns the *Capture Box Size*.
    GetCaptureBoxSize<epic_internal>()<transacts>:float = external {}