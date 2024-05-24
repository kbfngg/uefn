using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Component}
# Module import path: /UnrealEngine.com/Playspace
Playspace<public> := module:
    PlayerType<native><epic_internal> := enum:
        All
        ActivePlayer
        Spectator

    playspace_component<native><epic_internal> := class(vk_component):
        getPlayers<native><public>(Type:PlayerType)<transacts>:[]player_component

        getPlayerCount<native><public>(Type:PlayerType)<transacts>:int

        _WaitForSetupComplete<native><public>()<suspends>:void

        _WaitForMatchBegin<native><public>()<suspends>:void

        _WaitForMatchEnd<native><public>()<suspends>:void

        _WaitForPlayerAdded<native><public>()<suspends>:player_component

        _WaitForPlayerRemoved<native><public>()<suspends>:player_component

        setQueueUserForRespawnWhenAdded<native><public>(spawnWhenAdded:logic):void

        SetPlayerComponentClass<native><public>(ComponentType:type):void