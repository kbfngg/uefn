using {/Verse.org/Simulation}
# Used to send custom messages to the elimination feed.
elimination_feed_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates this device. `Agent` is used as the instigator of the action.
    Activate<public>(Agent:agent):void = external {}

    # Activates this device.
    # Requires *Activated by Team / Class* be set to `All`.
    Activate<public>():void = external {}