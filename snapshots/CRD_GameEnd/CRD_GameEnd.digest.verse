using {/Verse.org/Simulation}
# Used to configure rules that can end the current round or game.
end_game_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Ends the round/game. Uses `Agent`'s team to determine if the round/game ends when *Activating Team* is enabled.
    Activate<public>(Agent:agent):void = external {}

    # Ends the round/game. Determines who wins based on the *Winning Team* option.
    # If *Winning Team* is set to *Activating Team* and *Activating Team* is set to a value other than *Any*, it will declare that team as the winner.
    # If *Activating Team* is set to *Any* it will work the same as if *Winning Team* was set to *Winning Team*.
    ActivateNoAgent<epic_internal>():void = external {}

    ActivateNoAgentFunction<epic_internal>:device_function_set_params_by_type = external {}