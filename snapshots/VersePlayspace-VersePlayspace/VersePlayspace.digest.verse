using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/Playspace
Playspace<public> := module:
    @hide_in_editor
    @experimental
    playspace_association_component<native><epic_internal> := class<epic_internal>(component):
        IsAllowedOnClient<override>():logic = external {}

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