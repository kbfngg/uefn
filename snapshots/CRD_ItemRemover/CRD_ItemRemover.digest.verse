using {/Verse.org/Simulation}
# Used to cause `agent`s to drop or lose items from their inventory. For example, if an `agent` is *Down But Not Out*, they could drop items from their inventory, and other `agent`s could then pick up those items.
item_remover_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Remove items from `Agent`s inventory. The items that are removed can be configured using *Affected Items*.
    Remove<public>(Agent:agent):void = external {}