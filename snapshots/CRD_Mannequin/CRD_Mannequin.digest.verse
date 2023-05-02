using {/Verse.org/Simulation}
# Used to configure a single interactive mannequin, that can visualize characters, clothing, and perform emotes.
character_device<public> := class<concrete>(creative_device_base):
    # Signaled when an `agent` interacts with this device.
    # Sends the `agent` that interacted with this device.
    InteractedWithEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Shows this device.
    Show<public>():void = external {}

    # Hides this device.
    Hide<public>():void = external {}

    # Plays an emote on the character created by this device.
    PlayEmote<public>():void = external {}