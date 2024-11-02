using {/Verse.org/Simulation}
# Used to add fishing mechanics to experiences, such as:
#  * Fishing competitions between players.
#  * Collecting fish as a resource.
#  * Fishing minigames with their own rewards.
fishing_zone_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` catches a fish.
    # Sends the `agent` that caught the fish.
    CaughtEvent<public>:listenable(agent) = external {}

    # Signaled when all items have been caught and removed.
    # Sends the `agent` that caught the last fish.
    EmptyEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the number of available uses for this device back to *Uses Allowed*.
    Reset<public>():void = external {}

    # Returns all caught and removed items to the inventory. This only works when *Pool Type* is set to *Device Inventory*.
    Restock<public>():void = external {}