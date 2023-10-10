using {/Verse.org/Simulation}
# Used to manage sound buses via control bus mixes set on the Audio Mixer Device.
audio_mixer_device<public> := class<concrete><final>(creative_device_base):
    # Activates the mix set on the audio mixer.
    ActivateMix<public>():void = external {}

    # Deactivates the mix set on the audio mixer.
    DeactivateMix<public>():void = external {}

    # Adds `Agent` as a target when using the *CanBeHeardBy* Registered Players or NonRegisteredPlayers options.
    Register<public>(Agent:agent):void = external {}

    # Removes `Agent` as a target when using the *CanBeHeardBy* Registered Players or NonRegisteredPlayers options.
    Unregister<public>(Agent:agent):void = external {}

    # Removes all previously registered `agent`s when using the *CanBeHeardBy* Registered Players or NonRegisteredPlayers options.
    UnregisterAll<public>():void = external {}