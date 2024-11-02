using {/Verse.org/VerseEngine/Component}
using {/Verse.org/VerseEngine}
# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    agent<native><public> := class<unique><epic_internal>:


    localizable_agent<native><epic_internal> := class(localizable_value):
        Value<native><epic_internal>:agent

    MakeLocalizableValue<epic_internal>(Agent:agent):localizable_agent = external {}

    player<native><public> := class<unique><persistent><module_scoped_var_weak_map_key><epic_internal>(agent):
        IsActive<native><public>()<computes><decides><reads>:void

    # Module import path: /Verse.org/Simulation/player_array_helper
    player_array_helper<epic_internal> := module:
        TestFunc<native><epic_internal>(new_value:int):int

    player_multicast_delegate<native><epic_internal> := class<final>(multicast_delegate(player)):


    GetPlayerComponentByIndex<native><epic_internal>(PlayerIndex:int)<transacts><decides>:player_component

    player_component<native><epic_internal> := class<unique>(vk_component):
        GetHandle<native><public>()<transacts>:player

    GetComponentOfTypeForPlayer<native><epic_internal>(InPlayer:player_component, Type:type)<transacts><decides>:vk_component

    GetComponentOfTypeForPlayer<native><epic_internal>(PlayerIndex:int, Type:type)<transacts><decides>:vk_component

    GetOrCreateComponentOfTypeForPlayer<native><epic_internal>(InPlayer:player_component, Type:type)<transacts><decides>:vk_component

    GetOrCreateComponentOfTypeForPlayer<native><epic_internal>(PlayerIndex:int, Type:type)<transacts><decides>:vk_component

    # Type for which there is a single instance per round.  Use `GetSession` to get the current round's `session` instance. May be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to a single instance per game. Round-local behavior should not be relied upon.
    session<native><public> := class<unique><module_scoped_var_weak_map_key><epic_internal>:


    # Returns the `session` corresponding to the current round.  The result can be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to return a single instance per game. Round-local behavior should not be relied upon.
    GetSession<native><public>()<computes><reads>:session

    # Waits specified number of seconds and then resumes. If `Seconds` = 0.0 then it waits until next tick/frame/update. If `Seconds` = Inf then it waits forever and only calls back if canceled - such as via `race`. If `Seconds` < 0.0 then it completes immediately and does not yield to other aysnc expressions.
    # Waiting until the next update (0.0) is especially useful in a loop of a coroutine that needs to do some work every update and this yields to other coroutines so that it doesn't hog a processor's resources.
    # Waiting forever (Inf) will have any expression that follows never be evaluated. Occasionally it is desireable to have a task never complete such as the last expression in a `race` subtask where the task must never win the race though it still may be canceled earlier.
    # Immediately completing (less than 0) is useful when you want programmatic control over whether an expression yields or not.
    Sleep<native><public>(Seconds:float)<suspends>:void

    # Get the seconds that have elapsed since the world began simulating
    GetSimulationElapsedTime<native><public>()<transacts>:float

    team<native><public> := class<unique><epic_internal>:
