using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to track and react to how many players are in a particular area, and optionally display that information in game.
player_counter_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the player count matches *Target Player Count*. The frequency of evaluation against *Target Player Count* can be controlled through the device settings.
    CountSucceedsEvent<public>:listenable(tuple()) = external {}

    # Signaled when the player count does not match *Target Player Count*. The frequency of evaluation against *Target Player Count* can be controlled through the device settings.
    CountFailsEvent<public>:listenable(tuple()) = external {}

    # Signaled when a valid player enters the zone and is counted. The frequency of evaluation against the *Target Player Count* can be controlled through the device settings.
    # Sends the `agent` that is now being counted.
    CountedEvent<public>:listenable(agent) = external {}

    # Signaled when a player is no longer counted by this device, such as when they leave the zone, leave the game, or are assigned to a different `team` or class.
    # Sends the `agent` that is no longer being counted.
    RemovedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets *Target Player Count* to the default value defined in the device settings. If *Target Player Count* was previously incremented or decremented, this reset immediately triggers a new comparison.
    Reset<public>():void = external {}

    # Increments *Target Player Count* by `1`. Immediately triggers a new comparison.
    IncrementTargetCount<public>():void = external {}

    # Decrements *Target Player Count* by `1`. Immediately triggers a new comparison.
    DecrementTargetCount<public>():void = external {}

    # Triggers an evaluation of the current count vs *Target Player Count*, signaling `CountSucceedsEvent` or `CountFailsEvent` based on the evaluation result.
    CompareToTarget<public>():void = external {}

    # Triggers `CountedEvent` for all `agent`s currently being counted.
    TransmitForAllCounted<public>():void = external {}

    # Adds the player to the registered player list.
    # *Track Registered Players* determines how registered players are counted.
    Register<public>(Agent:agent):void = external {}

    # Removes the player from the registered player list.
    # *Track Registered Players* determines how registered players are counted.
    Unregister<public>(Agent:agent):void = external {}

    # Clears all players from the list of registered players.
    # *Track Registered Players* determines how registered players are counted.
    UnregisterAll<public>():void = external {}

    # Show this device in the world as an info panel showing Current + Required player counts.
    ShowInfoPanel<public>():void = external {}

    # Hide this device info panel from the world.
    HideInfoPanel<public>():void = external {}

    # Returns whether this device is represented in the world as an info panel showing Current + Required player counts.
    IsShowingInfoPanel<public>()<transacts><decides>:void = external {}

    # Sets the number of players required for this counter to succeed. Immediately triggers a new comparison.
    SetTargetCount<public>(Count:int):void = external {}

    # Returns the number of players required for this counter to succeed.
    GetTargetCount<public>()<transacts>:int = external {}

    # Teleports the `device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}

    # Returns the number of players currently counted by this device
    GetCount<public>()<transacts>:int = external {}

    # Is true if the device is currently succeeding in its comparison.
    IsPassingTest<public>()<transacts><decides>:void = external {}

    # Is true if `Agent` is currently counted by this device.
    IsCounted<public>(Agent:agent)<transacts><decides>:void = external {}