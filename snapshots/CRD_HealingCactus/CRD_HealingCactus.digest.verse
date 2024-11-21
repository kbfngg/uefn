using {/Verse.org/Simulation}
# Use to create a cactus with healing fruits that can be burst to heal nearby players.
healing_cactus_device<public> := class<concrete><final>(creative_device_base):
    # Triggers when the plant grows.
    GrowEvent<public>:listenable(tuple()) = external {}

    # Triggers when the plant bursts, passing in the triggering `agent`.
    BurstEvent<public>:listenable(?agent) = external {}

    # Enables the device to allow interaction and let it grow.
    Enable<public>():void = external {}

    # Disables the device to prevent interaction and growth.
    Disable<public>():void = external {}

    # Grows the plant if the device is enabled. If `Infinite Regrowths` is `false`, this is limited by `Maximum Regrowths`.
    # If someone is too close, the plant won't grow until they move away.
    Grow<public>():void = external {}

    # Burst the plant if the device is enabled, passing in the triggering `agent`.
    # If there is no triggering `agent`, players will only be healed if `Heal Targets` is set to `Everyone`.
    Burst<public>(Agent:agent):void = external {}

    # Burst the plant if the device is enabled, passing in the triggering `agent`.
    # If there is no triggering `agent`, players will only be healed if `Heal Targets` is set to `Everyone`.
    Burst<public>():void = external {}