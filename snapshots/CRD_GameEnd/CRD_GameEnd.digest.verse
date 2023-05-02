using {/Verse.org/Simulation}
# Used to configure rules that can end the current round or game.
end_game_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Ends the round/game. Uses `Agent`'s team to determine if the round/game ends when *Activating Team* is enabled.
    Activate<public>(Agent:agent):void = external {}