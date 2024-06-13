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

# Allows management of groups of `character_device`s e.g. changing all to have the same outfit, emote, or animation.
character_device_controller_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Changes the character appearance of the associated `character_device`s.
    ChangeCharacterAppearance<public>():void = external {}

    # Changes the character idle animation of the associated `character_device`s.
    ChangeCharacterIdleAnimated<public>():void = external {}

    # Changes the character idle pose of the associated `character_device`s.
    ChangeCharacterIdlePose<public>():void = external {}

    # Plays an emote on the associated `character_device`s.
    PerformEmote<public>():void = external {}

    # Resets the character appearance of the associated `character_device`s.
    ResetCharacters<public>():void = external {}

item_shop_mannequin_device<epic_internal> := class<final>(character_device):
    OpenStore<public>(Agent:agent):void = external {}