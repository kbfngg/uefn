using {/Verse.org/Simulation}
# Used to listen for the player activating or releasing certain inputs.
# The input is defined by the *Input* option.
# Players can configure the key for the input in the Creative Input Actions section of the Keyboard Settings.
input_trigger_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    # An Input Trigger will listen for inputs from players that meet the device requirements.
    Enable<public>():void = external {}

    # Disables this device.
    # A disabled Input Trigger will not listen for inputs 
    # and will never show on the HUD.
    Disable<public>():void = external {}

    # Signaled when the tracked input is pressed by an `agent`.
    # Sends the `agent` that pressed the input.
    PressedEvent<public>:listenable(agent) = external {}

    # Signaled when the tracked input is released by an `agent`.
    # Sends the `agent` that released the input.
    # Sends the `float` duration that the input was held.
    ReleasedEvent<public>:listenable(tuple(agent, float)) = external {}

    # Adds `Agent` to the registered player list.
    # *Registered Player Behavior* determines whether registered players meet the device requirements.
    Register<public>(Agent:agent):void = external {}

    # Removes `Agent` from the registered player list.
    # *Registered Player Behavior* determines whether registered players meet the device requirements.
    Unregister<public>(Agent:agent):void = external {}

    # Clears the list of registered players.
    # *Registered Player Behavior* determines whether registered players meet the device requirements.
    UnregisterAll<public>():void = external {}

    # Succeeds if `Agent` is currently holding the input.
    IsHeld<public>(Agent:agent)<transacts><decides>:void = external {}