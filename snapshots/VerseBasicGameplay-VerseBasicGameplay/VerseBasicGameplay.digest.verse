using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Module import path: /UnrealEngine.com/Temporary/VerseBasicGameplay
VerseBasicGameplay<public> := module:
    # Module import path: /UnrealEngine.com/Temporary/VerseBasicGameplay/PlayerManager
    PlayerManager<public> := module:
        basic_player_manager<public> := class<internal>:
            PlayerAddedEvent<public>:subscribable(player)

            PlayerRemovedEvent<public>:subscribable(player)

            GetPlayers<public>()<transacts>:[]player = external {}

            GetPlayerCount<public>()<transacts>:int = external {}

        GetPlayerManagerForLocation<public>(Location:vector3):?basic_player_manager = external {}