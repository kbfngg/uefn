using {/Verse.org/Simulation}
# Used to mark an `agent`'s position on the minimap and configure the information shown for marked `agent`s.Example configuration options: * Health and shield bars for marked players. * Distance to a marked player.Example marker appearance options: * Customized text label displayed on marked players. * Alternative minimap icon and icon color.
player_marker_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the first item type monitored on marked agents has changed.Sends the marked `agent`.
    FirstItemValueChangedEvent<public>:listenable(agent) = external {}

    # Signaled when the second item type monitored on marked agents has changed.Sends the marked `agent`.
    SecondItemValueChangedEvent<public>:listenable(agent) = external {}

    # Signaled when a marked `agent` meets the quantity condition for the first monitored item type(e.g. Fewer Than, Equal To, More Than X).Sends the marked `agent`.
    FirstItemValueReachedEvent<public>:listenable(agent) = external {}

    # Signaled when a marked `agent` meets the quantity condition for the second monitored item type(e.g. Fewer Than, Equal To, More Than X).Sends the marked `agent`.
    SecondItemValueReachedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Attaches a marker to `Agent`.
    Attach<public>(Agent:agent):void = external {}

    # Detaches a marker from `Agent`.
    Detach<public>(Agent:agent):void = external {}

    # Detaches markers from all marked `agent`s.
    DetachFromAll<public>():void = external {}