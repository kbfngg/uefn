# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    agent<native><public> := class<unique><epic_internal>:


    player<native><public> := class<unique><epic_internal>(agent):


    # Waits specified number of seconds and then resumes. If `Seconds` = 0.0 then it waits until next tick/frame/update. If `Seconds` = Inf then it waits forever and only calls back if canceled - such as via `race`. If `Seconds` < 0.0 then it completes immediately and does not yield to other aysnc expressions.Waiting until the next update (0.0) is especially useful in a loop of a coroutine that needs to do some work every update and this yields to other coroutines so that it doesn't hog a processor's resources.Waiting forever (Inf) will have any expression that follows never be evaluated. Occasionally it is desireable to have a task never complete such as the last expression in a `race` subtask where the task must never win the race though it still may be canceled earlier.Immediately completing (less than 0) is useful when you want programmatic control over whether an expression yields or not.
    Sleep<native><public>(Seconds:float)<suspends>:void

    # Get the seconds that have elapsed since the world began simulating
    GetSimulationElapsedTime<native><public>()<transacts>:float

    team<native><public> := class<unique><epic_internal>:
