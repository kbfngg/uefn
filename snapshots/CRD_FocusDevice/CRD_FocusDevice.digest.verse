using {/Verse.org/Simulation}
# Used to focus the camera on specific `agent`s.
camera_focus_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled when the camera focuses on an `agent`.
    # Sends the `agent` being focused on.
    FocusOnEvent<public>:listenable(agent) = external {}

    # Signaled when the camera stops focusing on an `agent`.
    # Sends the `agent` that stopped being focused on.
    FocusIsDroppedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Focuses the camera on `Agent`.
    Focus<public>(Agent:agent):void = external {}

    # Focuses the camera on all `agent`s.
    FocusAll<public>():void = external {}

    # Drops focus from `Agent`.
    DropFocus<public>(Agent:agent):void = external {}

    # Drops focus from all `agent`s.
    DropFocusForAll<public>():void = external {}