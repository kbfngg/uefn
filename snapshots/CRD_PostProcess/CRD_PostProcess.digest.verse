using {/Verse.org/Simulation}
# Used to apply Post Process Effects to players through the creative device rather than a Post Process Volume.
post_process_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a blend in event has finished. Sends the `agent` that used this device.
    BlendingInCompleteEvent<public>:listenable(?agent) = external {}

    # Signaled when a blend out event has finished. Sends the `agent` that used this device.
    BlendingOutCompleteEvent<public>:listenable(?agent) = external {}

    # Enables this device only for the instigating `Agent`. 
    Enable<public>(Agent:agent):void = external {}

    # Enables this device for all players.
    Enable<public>():void = external {}

    # Disables this device only for the instigating `Agent`. 
    Disable<public>(Agent:agent):void = external {}

    # Disables this device for all players.
    Disable<public>():void = external {}

    # Starts blending in the post process effect to the set strength only for the instigating `Agent`. 
    BlendIn<public>(Agent:agent):void = external {}

    # Starts blending in the post process effect to the set strength for all players.
    BlendInForAll<public>():void = external {}

    # Starts blending out the post process effect to 0 strength only for the instigating `Agent`. 
    BlendOut<public>(Agent:agent):void = external {}

    # Starts blending out the post process effect to 0 strength for all players.
    BlendOutForAll<public>():void = external {}

    # Resets to the starting strength, ending any ongoing blending only for the instigating `Agent`.
    Reset<public>(Agent:agent):void = external {}

    # Resets to the starting strength, ending any ongoing blending for all players.
    ResetForAll<public>():void = external {}