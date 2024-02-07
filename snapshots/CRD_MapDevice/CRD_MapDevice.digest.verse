using {/Verse.org/Simulation}
# Used to control the behavior of the map & minimap.
# Activation for a given `agent` can occur automatically via the device's *Activate Automatically* user option, by the `agent` entering and exiting the device's volume if using the *Activate on Trigger* user option, or via events from other devices or verse.
# When more than one map controller is activated for a given `agent`, the one with the highest *Map Priority* user option applies.
map_controller_device<public> := class<concrete><final>(creative_device_base):
    # Adds the map controller to the provided `Agent`'s map controller stack.
    # If multiple map controllers are active for an `agent`, the one with the highest *Map Priority* is used.
    Activate<public>(Agent:agent):void = external {}

    # Adds the map controller to all `agent`s in the experience.
    # If multiple map controllers are active for an `agent`, the one with the highest *Map Priority* is used.
    Activate<public>():void = external {}

    # Removes the map controller from the provided `Agent`'s map controller stack.
    # The next highest priority active map controller will be used, or if none exists, the default behavior will be restored.
    Deactivate<public>(Agent:agent):void = external {}

    # Removes the map controller from all `agent`s in the experience.
    # The next highest priority active map controller will be used, or if none exists, the default behavior will be restored.
    Deactivate<public>():void = external {}

    # Enables the device.
    # Enabling the device will allow it to be activated, both by incoming events, and by trigger if using *Activate on Trigger*.
    Enable<public>():void = external {}

    # Disables the device.
    # Disabling the device will deactivate it for all `agents` in the experience, turn off the trigger functionality, and prevent it from responding to events.
    Disable<public>():void = external {}

    # Sets the *Capture Box Size* (in meters).
    # *Capture Box Size* refers to the length and width of the area used for both the map capture image as well as the activation trigger.
    # Value is clamped between `25.0` and `2500.0` meters. 
    SetCaptureBoxSize<public>(Size:float):void = external {}

    # Returns the *Capture Box Size* (in meters).
    GetCaptureBoxSize<public>()<transacts>:float = external {}