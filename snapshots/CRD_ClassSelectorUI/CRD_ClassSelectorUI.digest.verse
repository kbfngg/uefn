using {/Verse.org/Simulation}
# Used to allow players to select their *Class* from a *Class Selector UI*.
class_selector_ui_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` selects a class.
    # Sends the `agent` that selected a class.
    ClassSelectedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` changes a class.
    # Sends the `agent` that selected a class and the `int` class that the player has changed to.
    ClassChangedEvent<public>:listenable(tuple(agent, int)) = external {}

    # Signaled when an `agent` closes the UI.
    # Sends the `agent` that closed the UI.
    UIClosedEvent<public>:listenable(agent) = external {}

    # Signaled when the UI is opened.
    # Sends the `agent` that is responsible for opening the UI.
    UIOpenedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Show the *Class Selector UI* to `Agent`.
    Show<public>(Agent:agent):void = external {}