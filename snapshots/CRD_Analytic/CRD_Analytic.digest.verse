using {/Verse.org/Simulation}
# Used to track `agent` events used to generate analytics.
analytics_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Adds an event for `Agent`.
    AddEvent<public>(Agent:agent):void = external {}