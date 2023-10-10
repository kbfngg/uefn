using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to trigger a visual effect (a glow or an outline) when `agent`s pick it up.
visual_effect_powerup_device<public> := class<concrete><final>(powerup_device):


# Holds and spawns items, with an optional cost for each item. Can hold up to three items, and `agent`s can cycle between these by hitting the machine with their pickaxe.
vending_machine_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an item is spawned from this device.
    # Sends the `agent` that used this device.
    ItemSpawnedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Cycles the screen to show the next item.
    CycleToNextItem<public>():void = external {}

    # Spawns an item.
    SpawnItem<public>():void = external {}

# Used to relay events to other linked devices.
trigger_device<public> := class<concrete><final>(trigger_base_device):
    # Signaled when an `agent` triggers this device.
    # Sends the `agent` that used this device. Returns `false` if no `agent` triggered the action (ex: it was triggered through code).
    TriggeredEvent<public>:listenable(?agent) = external {}

    # Triggers this device with `Agent` being passed as the `agent` that triggered the action. Use an `agent` reference when this device is setup to require one (for instance, you want to trigger the device only with a particular `agent`.
    Trigger<public>(Agent:agent):void = external {}

    # Triggers this device, causing it to activate its `TriggeredEvent` event.
    Trigger<public>():void = external {}

# Base class for various specialized trigger devices. See also: * `trigger_device` * `perception_trigger_device` * `attribute_evaluator_device`
trigger_base_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the number of times this device has been activated. This will set `GetTriggerCountRemaining` back to `0`
    Reset<public>():void = external {}

    # Sets the maximum amount of times this device can trigger.
    #  * `0` can be used to indicate no limit on trigger count.
    #  * `MaxCount` is clamped between [0,20].
    SetMaxTriggerCount<public>(MaxCount:int):void = external {}

    # Gets the maximum amount of times this device can trigger.
    #  * `0` indicates no limit on trigger count.
    GetMaxTriggerCount<public>()<transacts>:int = external {}

    # Returns the number of times that this device can still be triggered before hitting `GetMaxTriggerCount`.
    # Returns `0` if `GetMaxTriggerCount` is unlimited.
    GetTriggerCountRemaining<public>()<transacts>:int = external {}

    # Sets the time (in seconds) after triggering, before the device can be triggered again (if `MaxTrigger` count allows).
    SetResetDelay<public>(Time:float):void = external {}

    # Gets the time (in seconds) before the device can be triggered again (if `MaxTrigger` count allows).
    GetResetDelay<public>()<transacts>:float = external {}

    # Sets the time (in seconds) which must pass after triggering, before this device informs other external devices that it has been triggered.
    SetTransmitDelay<public>(Time:float):void = external {}

    # Gets the time (in seconds) which must pass after triggering, before this device informs other external devices that it has been triggered.
    GetTransmitDelay<public>()<transacts>:float = external {}

# A trap device that destroys the tile it's placed on when activated.
trick_tile_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the tile this device is attached to is removed. This may occur later than `TriggeredEvent` if *Activation Delay* is set on the device.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Signaled when this device is triggered.
    # Sends the `agent` that triggered this device.
    TriggeredEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device. While disabled this device will not react to incoming events.
    Disable<public>():void = external {}

    # Flips the device between `Enabled` and `Disable`.
    ToggleEnabled<public>():void = external {}

    # Restores the tile removed when this device was triggered.
    Reset<public>():void = external {}

    # Enables this device to trigger when an `agent` makes contact with the device.
    EnableAgentContactTrigger<public>():void = external {}

    # Disables this device from triggering when an `agent` makes contact with the device.
    DisableAgentContactTrigger<public>():void = external {}

    # Flips the device between `EnableAgentContactTrigger` and `DisableAgentContactTrigger.
    ToggleAgentContactTrigger<public>():void = external {}

    # Triggers the device, removing the associated tile.
    Trigger<public>():void = external {}

    # Teleports the `trick_tile_device` to the specified `Position` and `Rotation`. 
    # Only the trigger will teleport, the target buildings will not change. 
    TeleportTo<override>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `trick_tile_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly. 
    # Only the trigger will teleport, the target buildings will not change. 
    TeleportTo<override>(Transform:transform)<transacts><decides>:void = external {}

    # Moves the `trick_tile_device` to the specified `Position` and `Rotation` over the specified time, in seconds. 
    # Only the trigger will move, the target buildings will not change. 
    MoveTo<override>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `trick_tile_device` to the specified `Transform` over the specified time, in seconds. 
    # Only the trigger will move, the target buildings will not change. 
    MoveTo<override>(Transform:transform, OverTime:float)<suspends>:move_to_result = external {}

# Allows creation and HUD tracking of custom objectives for `agent`s to complete.
tracker_device<public> := class<concrete><final>(creative_device_base):
    # Resets the progress for `Agent` (and any `agent`s sharing progress).
    Reset<public>(Agent:agent):void = external {}

    # Signaled when the tracked value reaches `GetTarget` for an `agent`.
    # Sends the `agent` that reached `GetTarget` for their tracked value.
    CompleteEvent<public>:listenable(agent) = external {}

    # Assigns the device to `Agent` (and any `agent`s sharing progress).
    Assign<public>(Agent:agent):void = external {}

    # Assigns this device to all valid `agent`s.
    AssignToAll<public>():void = external {}

    # Removes this device from `Agent` (and any `agent`s sharing progress).
    Remove<public>(Agent:agent):void = external {}

    # Removes this device from all valid `agent`s.
    RemoveFromAll<public>():void = external {}

    # The objective immediately completes.
    Complete<public>(Agent:agent):void = external {}

    # Increases the tracked value by *Amount to Change on Received Signal* for `Agent`.
    Increment<public>(Agent:agent):void = external {}

    # Decrease the tracked value by *Amount to Change on Received Signal* for `Agent`.
    Decrement<public>(Agent:agent):void = external {}

    # Increases the target value for `Agent` by 1.
    IncreaseTargetValue<public>(Agent:agent):void = external {}

    # Decreases the target value for `Agent` by 1.
    DecreaseTargetValue<public>(Agent:agent):void = external {}

    # Saves tracked progress for `Agent`. Only valid if *Use Persistence* is set to *Use*.
    Save<public>(Agent:agent):void = external {}

    # Loads tracked progress for `Agent`. Only valid if *Use Persistence* is set to *Use*.
    Load<public>(Agent:agent):void = external {}

    # Loads tracked progress for all valid `agent`s. Only valid if *Use Persistence* is set to *Use*.
    LoadForAll<public>():void = external {}

    # Clears tracked progress for `Agent`. Only valid if *Use Persistence* is set to *Use*.
    ClearPersistence<public>(Agent:agent):void = external {}

    # Sets a description for the `tracker_device`, which is displayed if *Show on HUD* is enabled.
    # `Text` has a 64 character limit.
    SetDescriptionText<public>(Text:message):void = external {}

    # Sets the target value that must be achieved in order for `CompleteEvent` to trigger.
    # Clamped to `0 <= TargetValue <= 10000`.
    SetTarget<public>(TargetValue:int):void = external {}

    # Returns the target value that must be achieved in order for `CompleteEvent` to trigger.
    # Clamped to `0 <= GetTarget <= 10000`.
    GetTarget<public>()<transacts>:int = external {}

    # Sets the current tracked value for the device for all active players.
    SetValue<public>(Value:int):void = external {}

    # Sets the current tracked value for the device for the Team at the `TeamIndex`.
    # If *Sharing* is set to *Individual*, this will set the value for all team members.
    # If *Sharing* is set to *All*, this will set the value for all players.
    SetValue<public>(TeamIndex:int, Value:int):void = external {}

    # Sets the current tracked value for the device for a specific 'Agent'.
    # If *Sharing* is set to *Team*, this will set the value for their team.
    # If *Sharing* is set to *All*, this will set the value for everyone.
    SetValue<public>(Agent:agent, Value:int):void = external {}

    # Returns the current total tracked value for all players.
    GetValue<public>()<transacts>:int = external {}

    # Returns the current total tracked value for the team at `TeamIndex`.
    GetValue<public>(TeamIndex:int)<transacts>:int = external {}

    # Returns the current tracked value for `Agent`.
    GetValue<public>(Agent:agent)<transacts>:int = external {}

    # Sets the title for the `tracker_device`, which is displayed if *Show on HUD* is enabled.
    # `Text` has a 32 character limit.
    SetTitleText<public>(Text:message):void = external {}

    # Is true if `Agent` currently has the quest active.
    IsActive<public>(Agent:agent)<transacts><decides>:void = external {}

    # Is true if `Agent` has reached the *TargetValue* for the tracker.
    HasReachedTarget<public>(Agent:agent)<transacts><decides>:void = external {}

# Provides a way to keep track of the time something has taken, either for scoreboard purposes, or to trigger actions. It can be configured in several ways, either acting as a countdown to an event that is triggered at the end, or as a stopwatch for an action that needs to be completed before a set time runs out.
timer_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the timer completes or ends with success.
    # Sends the `agent` that activated the timer, if any.
    SuccessEvent<public>:listenable(?agent) = external {}

    # Signaled when the timer completes or ends with failure.
    # Sends the `agent` that activated the timer, if any.
    FailureEvent<public>:listenable(?agent) = external {}

    # Signaled when the timer enters *Urgency Mode*.
    # Sends the `agent` that activated the timer, if any.
    StartUrgencyModeEvent<public>:listenable(?agent) = external {}

    # Enables this device for `Agent`.
    Enable<public>(Agent:agent):void = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device for `Agent`. While disabled this device will not receive signals.
    Disable<public>(Agent:agent):void = external {}

    # Disables this device. While disabled this device will not receive signals.
    Disable<public>():void = external {}

    # Resets the timer back to its base time and stops it for `Agent`.
    Reset<public>(Agent:agent):void = external {}

    # Resets the timer back to its base time and stops it.
    Reset<public>():void = external {}

    # Resets the timer back to its base time and stops it for all `agent`s.
    ResetForAll<public>(Agent:agent):void = external {}

    # Resets the timer back to its base time and stops it for all `agent`s.
    ResetForAll<public>():void = external {}

    # Starts the timer for `Agent`.
    Start<public>(Agent:agent):void = external {}

    # Starts the timer.
    Start<public>():void = external {}

    # Pauses the timer for `Agent`.
    Pause<public>(Agent:agent):void = external {}

    # Pauses the timer.
    Pause<public>():void = external {}

    # Resumes the timer for `Agent`.
    Resume<public>(Agent:agent):void = external {}

    # Resumes the timer.
    Resume<public>():void = external {}

    # Completes the timer for `Agent`.
    Complete<public>(Agent:agent):void = external {}

    # Completes the timer.
    Complete<public>():void = external {}

    # Starts the timer for all `agent`s.
    StartForAll<public>(Agent:agent):void = external {}

    # Starts the timer for all `agent`s.
    StartForAll<public>():void = external {}

    # Pauses the timer for all `agent`s.
    PauseForAll<public>(Agent:agent):void = external {}

    # Pauses the timer for all `agent`s.
    PauseForAll<public>():void = external {}

    # Resumes the timer for all `agent`s.
    ResumeForAll<public>(Agent:agent):void = external {}

    # Resumes the timer for all `agent`s.
    ResumeForAll<public>():void = external {}

    # Completes the timer for all `agent`s.
    CompleteForAll<public>(Agent:agent):void = external {}

    # Completes the timer for all `agent`s.
    CompleteForAll<public>():void = external {}

    # Saves this device's data for `Agent`.
    Save<public>(Agent:agent):void = external {}

    # Loads this device's saved data for `Agent`.
    Load<public>(Agent:agent):void = external {}

    # Clears this device's saved data for `Agent`.
    ClearPersistenceData<public>(Agent:agent):void = external {}

    # Clears this device's saved data for all `agent`s.
    ClearPersistenceDataForAll<public>(Agent:agent):void = external {}

    # Clears this device's saved data for all `agent`s.
    ClearPersistenceDataForAll<public>():void = external {}

    # Sets the remaining time (in seconds) on the timer, if active, on `Agent`.
    SetActiveDuration<public>(Time:float, Agent:agent):void = external {}

    # Sets the remaining time (in seconds) on the timer, if active. Use this function if the timer is set to use the same time for all `agent`'s.
    SetActiveDuration<public>(Time:float):void = external {}

    # Returns the remaining time (in seconds) on the timer for `Agent`.
    GetActiveDuration<public>(Agent:agent)<transacts>:float = external {}

    # Returns the remaining time (in seconds) on the timer if it is set to be global.
    GetActiveDuration<public>()<transacts>:float = external {}

    # Sets the lap time indicator for `Agent`.
    SetLapTime<public>(Agent:agent):void = external {}

    # Sets the lap time indicator for all `agent`s.
    SetLapTimeForAll<public>(Agent:agent):void = external {}

    # Sets the lap time indicator for all `agent`s.
    SetLapTimeForAll<public>():void = external {}

    # Sets the maximum duration of the timer (in seconds).
    SetMaxDuration<public>(Time:float):void = external {}

    # Returns the maximum duration of the timer (in seconds).
    GetMaxDuration<public>()<transacts>:float = external {}

    # Succeeds if this device is tracking timer state for each individual `agent` independently. Fails if state is being tracked globally for all `agent`'s.
    IsStatePerAgent<public>()<transacts><decides>:void = external {}

# Configures game modes where players can start or stop timers to advance gameplay objectives, such as Attack/Defend Bomb objectives.
timed_objective_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the objective begins.
    # Sends the `agent` that started the timer.
    BeganEvent<public>:listenable(agent) = external {}

    # Signaled when the objective ends.
    # Sends the `agent` that stopped the timer.
    EndedEvent<public>:listenable(agent) = external {}

    # Signaled when the objective is paused.
    # Sends the `agent` that paused the timer.
    PausedEvent<public>:listenable(agent) = external {}

    # Signaled when the objective is resumed.
    # Sends the `agent` that resumed the timer.
    ResumedEvent<public>:listenable(agent) = external {}

    # Signaled when the objective is restarted.
    # Sends the `agent` that restarted the timer.
    RestartedEvent<public>:listenable(agent) = external {}

    # Signaled when the objective is completed.
    # Sends the `agent` that started the timer or completed the timer by calling `Complete`.
    CompletedEvent<public>:listenable(agent) = external {}

    # Enables the objective for `Agent`.
    Enable<public>(Agent:agent):void = external {}

    # Disables the objective for `Agent`.
    Disable<public>(Agent:agent):void = external {}

    # Makes this device visible.
    Show<public>():void = external {}

    # Makes this device invisible.
    Hide<public>():void = external {}

    # Starts the objective with `Agent` acting as the user the interacted this device.
    Begin<public>(Agent:agent):void = external {}

    # Ends the objective with `Agent` acting as the user the interacted this device.
    End<public>(Agent:agent):void = external {}

    # Pauses the objective with `Agent` acting as the user the interacted this device.
    Pause<public>(Agent:agent):void = external {}

    # Resumes the objective with `Agent` acting as the user the interacted this device.
    Resume<public>(Agent:agent):void = external {}

    # Restarts the objective with `Agent` acting as the user the interacted this device.
    Restart<public>(Agent:agent):void = external {}

    # Completes the objective with `Agent` acting as the user the interacted this device.
    Complete<public>(Agent:agent):void = external {}

# Customizable rift that allows `agent`s to move instantly between locations. You can use this to move players around your island, or create multi-island experiences with teleporters that take players from one island to another.
teleporter_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` enters this device.
    # Sends the `agent` that entered this device.
    EnterEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` emerges from this device.
    # Sends the `agent` that emerged from this device.
    TeleportedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Teleport `Agent` to the target group using this device.
    Activate<public>(Agent:agent):void = external {}

    # When a link is activated, the current destination teleporter will be able to bring the `agent` back to this origin teleporter. Both origin and destination teleporters need to have this activated to work as expected.
    ActivateLinkToTarget<public>():void = external {}

    # Deactivates any currently active Link. The current destination teleporter will no longer be able to return the agent to this origin teleporter.
    DeactivateLinkToTarget<public>():void = external {}

    # Resets the currently selected destination teleporter, and selects an eligible destination. If the target is a *Teleporter Group*, this may be another randomly chosen `teleporter_device` from that group.
    ResetLinkToTarget<public>():void = external {}

    # Teleport `Agent` to this device.
    Teleport<public>(Agent:agent):void = external {}

# Provides team and inventory configurations that go beyond the choices the My Island settings provide.
# Can also be used to customize individual devices and create variations in team setup.
team_settings_and_inventory_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an enemy of *Team* is eliminated by a team member.
    # Sends the `agent` team member who eliminated the enemy.
    EnemyEliminatedEvent<public>:listenable(agent) = external {}

    # Signaled when a member of *Team* is eliminated.
    # Sends the `agent` that was eliminated.
    TeamMemberEliminatedEvent<public>:listenable(agent) = external {}

    # Signaled when a member of *Team* is spawned.Sends the `agent` that has spawned.
    TeamMemberSpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when *Team* runs out of respawns.
    TeamOutOfRespawnsEvent<public>:listenable(tuple()) = external {}

    # Ends the round and *Team* wins the round.
    EndRound<public>():void = external {}

    # Is true if `Agent` is on *Team*.
    IsOnTeam<public>(Agent:agent)<transacts><decides>:void = external {}

# Used to place the Infinity Blade on your island. When placed, the Infinity Blade becomes available to any player regardless of team affiliation.
sword_in_the_stone_device<public> := class<concrete><final>(creative_device_base):


# DEPRECATED This device is no longer supported.Used to inform players of other content made by a creator using a Support-A-Creator code. When players activate the device, it will bring up the same Support-A-Creator dialog box they would see in the Creative hub. The Support-A-Creator information shows when the dialog box opens for the player.
support_a_creator_device<public> := class<concrete><final>(creative_device_base):


# Base class for various specialized storm devices. See also: * `basic_storm_controller_device` * `advanced_storm_controller_device`
storm_controller_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Signaled when storm resizing ends. Use this with the *On Finish Behavior* option for better controls.
    PhaseEndedEvent<public>:listenable(tuple()) = external {}

    # Generates the storm. *Generate Storm On Game Start* must be set to *No* if you choose to use `GenerateStorm`.
    GenerateStorm<public>():void = external {}

    # Destroys the storm.
    DestroyStorm<public>():void = external {}

    # Teleports the `storm_controller_device` to the specified `Position` and `Rotation`. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `storm_controller_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Transform:transform)<transacts><decides>:void = external {}

    # Moves the `storm_controller_device` to the specified `Position` and `Rotation` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `storm_controller_device` to the specified `Transform` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Transform:transform, OverTime:float)<suspends>:move_to_result = external {}

# A set of customizable pop up targets that can be hit by players to trigger various events.
shooting_range_target_track_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when target is hit in the bullseye area.
    BullseyeHitEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target is hit by a player.
    HitEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target is hit by a player.
    KnockdownEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves up slightly, making it harder to hit.
    HopUpEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves down slightly, making it harder to hit.
    HopDownEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves from laying flat to standing upright.
    PopUpEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves from standing upright to laying flat.
    PopDownEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the target to its initial settings.
    Reset<public>():void = external {}

    # Moves an active (standing upright) target attached to the track up slightly, in an effort to make it harder to hit
    HopUp<public>():void = external {}

    # Moves an active (standing upright) target attached to the track down slightly, in an effort to make it harder to hit
    HopDown<public>():void = external {}

    # Causes the target attached to the track to transition from lying flat (inactive) to standing upright (active)
    PopUp<public>():void = external {}

    # Causes the target attached to the track to transition from standing upright (active) to lying flat (inactive)
    PopDown<public>():void = external {}

    # Enables movement on the track. This does not start the target moving, it only enables movement.
    EnableTrackMovement<public>():void = external {}

    # Disables movement on the track. This prevents any movement from occurring, until track movement is enabled again.
    DisableTrackMovement<public>():void = external {}

    # Activates the movement track.
    ActivateTrack<public>():void = external {}

    # Deactivates the movement track.
    DeactivateTrack<public>():void = external {}

    # Starts the target moving toward the end of the track.
    MoveToEnd<public>():void = external {}

    # Starts the target moving toward the start of the track.
    MoveToStart<public>():void = external {}

# A single customizable pop up target that can be hit by `agent`s to trigger various events.
shooting_range_target_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the target is hit in the bullseye area.
    BullseyeHitEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target is hit by an `agent`.
    HitEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target takes enough damage to get knocked down.
    KnockdownEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves up slightly, making it harder to hit.
    HopUpEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves down slightly, making it harder to hit.
    HopDownEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves from laying flat to standing upright.
    PopUpEvent<public>:listenable(tuple()) = external {}

    # Signaled when the target moves from standing upright to laying flat.
    PopDownEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the target to its initial settings.
    Reset<public>():void = external {}

    # Moves an active (standing upright) target up slightly, in an effort to make it harder to hit.
    HopUp<public>():void = external {}

    # Moves an active (standing upright) target down slightly, in an effort to make it harder to hit.
    HopDown<public>():void = external {}

    # Causes a target to transition from lying flat (inactive) to standing upright (active).
    PopUp<public>():void = external {}

    # Causes a target to transition from standing upright (active) to lying flat (inactive).
    PopDown<public>():void = external {}

# Used to manipulate scores using in-experience triggers. If *Activating Team* is set to a specific team, then you should use the `agent` overloads of each function. The `agent`'s team will be used to determine if that `agent` is allowed to affect the state of the device.
score_manager_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the this device reaches its maximum number of triggers as defined by *Times Can Trigger*.
    # Sends the `agent` who last triggered the device.
    MaxTriggersEvent<public>:listenable(agent) = external {}

    # Signaled when the this device awards points to an `agent`.
    # Sends the `agent` who received the points.
    ScoreOutputEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>(Agent:agent):void = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>(Agent:agent):void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets this device to its original state.
    Reset<public>(Agent:agent):void = external {}

    # Resets this device to its original state.
    Reset<public>():void = external {}

    # Grant points to `Agent`.
    Activate<public>(Agent:agent):void = external {}

    # Grants points.
    Activate<public>():void = external {}

    # Increments the score quantity to be awarded by the next activation by `1`.
    Increment<public>(Agent:agent):void = external {}

    # Increments the score quantity to be awarded by the next activation by `1`.
    Increment<public>():void = external {}

    # Decrements the score quantity to be awarded by the next activation by `1`.
    Decrement<public>(Agent:agent):void = external {}

    # Decrements the score quantity to be awarded by the next activation by `1`.
    Decrement<public>():void = external {}

    # Sets the score to be awarded by the next activation to `Value`.
    SetScoreAward<public>(Value:int):void = external {}

    # Returns the score to be awarded by the next activation.
    GetScoreAward<public>()<transacts>:int = external {}

    # Sets the score to be awarded by the next activation to `Agent`'s current score.
    SetToAgentScore<public>(Agent:agent):void = external {}

    # Returns the current score for `Agent`.
    GetCurrentScore<public>(Agent:agent)<transacts>:int = external {}

# Used to customize gameplay for any round-based game. It generally defines what happens to the`agent`'s inventory and rewards in each round.
round_settings_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a game round starts.
    RoundBeginEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Enables the ability for players to Matchmake into the Island. Only applies to published games that have matchmaking turned on in the Island settings
    EnableMatchmaking<public>():void = external {}

    # Disables the ability for players to Matchmake into the Island. Only applies to published games that have matchmaking turned on in the Island settings
    DisableMatchmaking<public>():void = external {}

    # Toggles between `EnableMatchmaking` and `DisableMatchmaking`.
    ToggleMatchmaking<public>():void = external {}

    # Disables all end-round conditions. The round must be ended through calling `EndRound` or a creative event after this is called.
    DisableEndRoundConditions<public>():void = external {}

    # Ends the round immediately with `Agent`'s team set as the winner of the round.
    EndRound<public>(Agent:agent):void = external {}

# Used to generate random numbers between a minimum and maximum value. Events are signaled when numbers are generated.
#  * *Value Limit 1* is the minimum value for generation.
#  * *Value Limit 2* is the maximum value for generation.
rng_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the generated number >= *Winning Value*.
    WinEvent<public>:listenable(tuple()) = external {}

    # Signaled when the generated number < *Winning Value*.
    LoseEvent<public>:listenable(tuple()) = external {}

    # Signaled when the generated number = maximum.
    RolledMaxEvent<public>:listenable(tuple()) = external {}

    # Signaled when the generated number = minimum.
    RolledMinEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Randomly generate a number between *Value Limit 1* and *Value Limit 2*.
    #  * If the number is >= *Winning Value* then `WinEvent` is fired.
    #  * If the number is < *Winning Value* then `LoseEvent` is fired.
    #  * If the number = minimum then `RolledMinEvent` is fired.
    #  * If the number = maximum then `RolledMaxEvent` is fired.
    #  * `Agent` is used as the Instigator of the roll event.
    Activate<public>(Agent:agent):void = external {}

    # Randomly roll a number within the configured min + max value range.
    #  * If the number is >= *Winning Value* then `WinEvent` is fired.
    #  * If the number is < *Winning Value* then `LoseEvent` is fired.
    #  * If the number = minimum then `RolledMinEvent` is fired.
    #  * If the number = maximum then `RolledMaxEvent` is fired.
    Activate<public>():void = external {}

    # Cancels the active number generation.
    Cancel<public>():void = external {}

# Used to play curated music from the device or one or more registered `agent`s.
radio_device<public> := class<concrete><final>(creative_device_base):
    # Starts playing audio from this device.
    Play<public>():void = external {}

    # Stops playing audio from this device.
    Stop<public>():void = external {}

    # Adds the specified agent as a target for the Radio to play audio from
    Register<public>(Agent:agent):void = external {}

    # Removes the specified agent as a target for the Radio to play audio from if previously Registered
    Unregister<public>(Agent:agent):void = external {}

    # Removes all previously registered agents as targets for the Radio to play audio from
    UnregisterAll<public>():void = external {}

    # Shows this device in the world.
    Show<public>()<transacts>:void = external {}

    # Hides this device from the world.
    Hide<public>()<transacts>:void = external {}

# A device used to damage players who collide with it. Can also be used as a trigger to activate other devices.
pulse_trigger_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Starts the damage sequence.
    Begin<public>():void = external {}

    # Stops the damage sequence.
    End<public>():void = external {}

    # Resumes the damage sequence from the last position where it was stopped.
    ResumeSequence<public>():void = external {}

    # Sets the damage to be applied to those hit by an active wave. Clamped between `0 <= GetDamage <= 100000`.
    # Wave visuals will change to reflect whether the wave causes damage or not.
    SetDamage<public>(Damage:float):void = external {}

    # Returns the damage to be applied to those hit by an active wave. Clamped between `0 <= GetDamage <= 100000`.
    GetDamage<public>()<transacts>:float = external {}

    # Sets the total number of waves this sequence will complete before ending its sequence. `LoopCount = 0` indicates the sequence should continue indefinitely.
    SetLoopCount<public>(LoopCount:int):void = external {}

    # Returns the total number of waves this sequence will complete before ending its sequence.
    # `0` indicates the sequence will continue indefinitely.
    GetLoopCount<public>()<transacts>:int = external {}

    # Sets the speed (in meters per second) at which the waves generated by this sequencer will travel.
    SetWaveSpeed<public>(Speed:float):void = external {}

    # Returns the speed (in meters per second) at which the waves generated by this sequencer will travel.
    GetWaveSpeed<public>()<transacts>:float = external {}

# Base class for devices that spawn a prop object.
prop_spawner_base_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Spawns the prop associated with this device.
    SpawnObject<public>():void = external {}

    # Destroys all props spawned from this device.
    DestroyAllSpawnedObjects<public>():void = external {}

# Allows customization of the Prop-o-Matic weapon functions and how the game reacts to players using it.
prop_o_matic_manager_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` begins entering a disguise.
    # Sends the `agent` that began entering the disguise.
    BeginEnteringDisguiseEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` finishes entering a disguise.
    # Sends the `agent` that finished entering the disguise.
    FinishEnteringDisguiseEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits a disguise.
    # Sends the `agent` that exited the disguise.
    ExitingDisguiseEvent<public>:listenable(agent) = external {}

    # Toggle Pinging props on/off.
    SetPingProps<public>(On:logic):void = external {}

    # Adjust the ping time.
    SetPingFrequency<public>(Time:float):void = external {}

    # Toggle showing the props remaining on the UI.
    SetShowPropsRemaining<public>(On:logic):void = external {}

    # Toggle showing the prop ping cooldown.
    SetShowPropPingCooldown<public>(On:logic):void = external {}

    # Manually ping all players that are currently hiding as props.
    PingPlayerProps<public>():void = external {}

    # Manually ping a specific player if they are currently a prop.
    PingPlayerProp<public>(Agent:agent):void = external {}

    # Returns whether a player is currently hiding or not.
    IsPlayerProp<public>(Agent:agent)<transacts><decides>:void = external {}

# Base class for various powerup devices offering common events like `ItemPickedUpEvent`.
powerup_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Signaled when the powerup is picked up by an `agent`.
    # Sends the `agent` that picked up the powerup.
    ItemPickedUpEvent<public>:listenable(agent) = external {}

    # Spawns the powerup into the experience so users can interact with it.
    Spawn<public>():void = external {}

    # Despawns this powerup from the experience.
    Despawn<public>():void = external {}

    # Updates the *Duration* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    SetDuration<public>(Time:float):void = external {}

    # Returns the *Duration* that this powerup will be active for on any player it is applied to.
    GetDuration<public>()<transacts>:float = external {}

    # If the `Agent` has the effect applied to them, this will return the remaining time the effect has.
    # Returns -1.0 if the effect has an infinite duration.
    # Returns 0 if the `Agent` does not have the effect applied.
    GetRemainingTime<public>(Agent:agent)<transacts>:float = external {}

    # Returns the `Agent` has the powerup's effect (or another of the same type) applied to them.
    HasEffect<public>(Agent:agent)<transacts><decides>:void = external {}

    # Grants this powerup to `Agent`.
    Pickup<public>(Agent:agent):void = external {}

    # Grants this powerup without an agent reference.
    # Requires *Apply To* set to *All Players*.
    Pickup<public>():void = external {}

# Used to move, damage, and give scores to players that interact with it. By default, it is activated by any player touching its front face, which rotates it counterclockwise and knocks those players away from it and slightly upward.
pinball_flipper_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Causes `Agent` to activate this device.
    Activate<public>(Agent:agent):void = external {}

# A triggered bumper that can knock players back, damage them, and award points.
pinball_bumper_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates this device.
    Activate<public>():void = external {}

# Specialized `trigger_base_device` that will fire output events based on line of sight between `agent`s and the device.
perception_trigger_device<public> := class<concrete><final>(trigger_base_device):
    # Signaled when an `agent` has direct line of sight to this device.
    # Sends the `agent` that has seen this device.
    AgentLooksAtDeviceEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` has lost direct line of sight to this device.
    # Sends the `agent` that has lost sight of this device.
    AgentLooksAwayFromDeviceEvent<public>:listenable(agent) = external {}

    # Signaled when this device has direct line of sight to an `agent`.
    # Sends the `agent` seen by this device.
    DeviceSeesAgentEvent<public>:listenable(agent) = external {}

    # Signaled when this device loses direct line of sight to an `agent`.
    # Sends the `agent` this device has lost sight of.
    DeviceLosesSightOfAgentEvent<public>:listenable(agent) = external {}

# Provides a collection of destructible devices that you can select from to use as objectives in your game.
objective_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device has been destroyed by an `agent`.
    # Sends the `agent` that destroyed this device.
    DestroyedEvent<public>:listenable(agent) = external {}

    # Shows this device in the world.
    Show<public>():void = external {}

    # Hides this device from the world.
    Hide<public>():void = external {}

    # Activates an objective pulse at `Agent`'s location pointing toward this device.
    ActivateObjectivePulse<public>(Agent:agent):void = external {}

    # Deactivates the objective pulse at `Agent`'s location.
    DeactivateObjectivePulse<public>(Agent:agent):void = external {}

    # Destroys the objective item. This is done regardless of the visibility or health of the item.
    Destroy<public>(Agent:agent):void = external {}

# Used to temporarily modify the speed of `agent`s and vehicles.
movement_modulator_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivationEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates this device's movement effect on `Agent`.
    Activate<public>(Agent:agent):void = external {}

# Used to take players to different islands and to link experiences together.
matchmaking_portal_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

# Used to create custom points of interest and markers on the minimap and overview map.
map_indicator_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates an objective pulse at `Agent`'s location pointing toward this device.
    ActivateObjectivePulse<public>(Agent:agent):void = external {}

    # Deactivates the objective pulse at `Agent`'s location.
    DeactivateObjectivePulse<public>(Agent:agent):void = external {}

# Used to customize the state and accessibility of doors. `lock_device` only works with assets that have a door attached.
lock_device<public> := class<concrete><final>(creative_device_base):
    # Locks the door. `Agent` is the instigator of the action.
    Lock<public>(Agent:agent):void = external {}

    # Unlocks the door. `Agent` is the instigator of the action.
    Unlock<public>(Agent:agent):void = external {}

    # Toggles between `Lock` and `Unlock`. `Agent` is the instigator of the action.
    ToggleLocked<public>(Agent:agent):void = external {}

    # Opens the door. `Agent` is the instigator of the action.
    Open<public>(Agent:agent):void = external {}

    # Closes the door. `Agent` is the instigator of the action.
    Close<public>(Agent:agent):void = external {}

    # Toggles between `Open` and `Close`. `Agent` is the instigator of the action.
    ToggleOpened<public>(Agent:agent):void = external {}

# Used to configuration and spawn items that players can pick up and use.
item_spawner_device<public> := class<concrete><final>(base_item_spawner_device):
    # Cycles device to next configured item.
    CycleToNextItem<public>():void = external {}

    # Spawns the current item.
    SpawnItem<public>():void = external {}

    # Sets device *Respawn Item on Timer* option (see `SetTimeBetweenSpawns`)
    SetEnableRespawnTimer<public>(Respawn:logic):void = external {}

    # Returns device *Respawn Item on Timer* option (see `SetTimeBetweenSpawns`)
    GetEnableRespawnTimer<public>()<transacts>:logic = external {}

    # Sets the *Time Between Spawns* (in seconds) after an item is collected before the next is spawned, if this device has *Respawn Item on Timer* enabled (see `SetEnableRespawnTimer`)
    SetTimeBetweenSpawns<public>(Time:float):void = external {}

    # Returns the *Time Between Spawns* (in seconds) after an item is collected before the next is spawned, if this device has *Respawn Item on Timer* enabled (see `SetEnableRespawnTimer`)
    GetTimeBetweenSpawns<public>()<transacts>:float = external {}

# Used to grant items to `agent`s. Items can either be dropped at the `agent`'s location or added directly to their inventory.
item_granter_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an item is granted to an `agent`.
    # Sends the `agent` that was granted the item.
    ItemGrantedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Clears saved data for `Agent`, preventing them from receiving items while offline. This only works when *Grant While Offline* is set to *Yes*.
    ClearSaveData<public>(Agent:agent):void = external {}

    # Cycles to the next item. If *Grant on Cycle* is set `Agent` will be granted the item.
    CycleToNextItem<public>(Agent:agent):void = external {}

    # Cycles to the previous item. If *Grant on Cycle* is set `Agent` will be granted the item.
    CycleToPreviousItem<public>(Agent:agent):void = external {}

    # Cycles to a random item. If *Grant on Cycle* is set `Agent` will be granted the item.
    CycleToRandomItem<public>(Agent:agent):void = external {}

    # Grants an item to `Agent`.
    GrantItem<public>(Agent:agent):void = external {}

    # Restocks this device back to its starting inventory count.
    RestockItems<public>():void = external {}

    # Sets the next item to be granted.
    #  * `Index` should be between `0` and the available item count - 1.
    #  * Calling `SetNextItem` with an invalid index will do nothing.
    SetNextItem<public>(Index:int):void = external {}

# Used to show custom HUD messages to one or more `agent`s.
hud_message_device<public> := class<concrete><final>(creative_device_base):
    # Shows the currently set HUD *Message* on `Agent`s screen. Will replace any previously active message.
    # Use this when the device is setup to target specific `agent`s.
    Show<public>(Agent:agent):void = external {}

    # Shows the currently set *Message* HUD message on screen. Will replace any previously active message.
    Show<public>():void = external {}

    # Hides the HUD message.
    Hide<public>():void = external {}

    # Displays a Custom message to a specific *Agent* that you define.Setting *DisplayTime* to `0.0` will display the HUD message persistently.If not defined, or less than `0.0` the message will show for the time set on the device.
    Show<public>(Agent:agent, Message:message, ?DisplayTime:float = external {}):void = external {}

    # Displays a Custom message that you define for all PlayersSetting *DisplayTime* to `0.0` will display the HUD message persistently.If not defined, or less than `0.0` the message will show for the time set on the device.
    Show<public>(Message:message, ?DisplayTime:float = external {}):void = external {}

    # Sets the time (in seconds) the HUD message will be displayed. `0.0` will display the HUD message persistently.
    SetDisplayTime<public>(Time:float):void = external {}

    # Returns the time (in seconds) for which the HUD message will be displayed. `0.0` means the message is displayed persistently.
    GetDisplayTime<public>()<transacts>:float = external {}

    # Sets the *Message* to be displayed when the HUD message is activated. `Text` is clamped to 150 characters.
    SetText<public>(Text:message):void = external {}

# Used to create a holographic screen that displays a clock or other curated images.
holoscreen_device<public> := class<concrete><final>(creative_device_base):


# Used to let `agent`s slide on any surface with accompanying visual and audio effects.
grind_powerup_device<public> := class<concrete><final>(powerup_device):


# Used to provide fuel sources for vehicles. Can also be used to deal considerable damage to `agent`s and the environment when destroyed.
fuel_pump_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the fuel pump is emptied.
    # Sends the `agent` that emptied the fuel pump.
    EmptyEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets fuel stock to *Fuel Capacity* value.
    Reset<public>():void = external {}

    # Grants fuel to `Agent`.
    Empty<public>(Agent:agent):void = external {}

# Hazard which deals damage in a radius around it when destroyed or triggered.
explosive_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device explodes.
    # Sends the `agent` that caused the explosion.
    ExplodedEvent<public>:listenable(agent) = external {}

    # Shows this device in the world.
    Show<public>():void = external {}

    # Hides this device from the world.
    Hide<public>():void = external {}

    # Resets this device.
    Reset<public>():void = external {}

    # Triggers this device to explode. Passes `Agent` as the instigator of the explosion.
    Explode<public>(Agent:agent):void = external {}

# Used to customize high level properties of the game mode.
experience_settings_device<public> := class<concrete><final>(creative_device_base):


# Used to spawn items when an `agent` or specified target is eliminated.
elimination_manager_device<public> := class<concrete><final>(base_item_spawner_device):
    # Signaled when a qualifying elimination occurs.
    # Sends the eliminated `agent`.
    EliminatedEvent<public>:listenable(agent) = external {}

    # Signaled when a qualifying elimination occurs.
    # Sends the eliminator `agent`. If the eliminator is a non-agent then `false` is returned.
    EliminationEvent<public>:listenable(?agent) = external {}

# Used to amplify an `agent`'s damage temporarily. This applies to any weapon the `agent` is using at the time of the powerup.
damage_amplifier_powerup_device<public> := class<concrete><final>(powerup_device):
    # Sets the *Magnitude* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    # For the Damage Amplifier Powerup, this is the damage multiplier.
    SetMagnitude<public>(Magnitude:float):void = external {}

    # Returns the current *Magnitude* for the powerup.
    # For the Damage Amplifier Powerup, this is the damage multiplier.
    GetMagnitude<public>()<transacts>:float = external {}

# Used to create a specialized button which can only be activated when `agent`s are carrying specific items.
conditional_button_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device is activated.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Signaled when this device fails to activate because `agent` didn't have the required items.
    # Sends the `agent` that attempted to activate the device.
    NotEnoughItemsEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets this device to its original settings.
    Reset<public>():void = external {}

    # Activates this device. `Agent` is used as the instigator of the action.
    Activate<public>(Agent:agent):void = external {}

    # Toggles the conditional button state. `Agent` is used as the instigator of the action.
    Toggle<public>(Agent:agent):void = external {}

    # Sets the text that appears when `agent`s approach the device. `Text` is limited to `150` characters.
    SetInteractionText<public>(Text:message):void = external {}

    # Sets the time (in seconds) that an interaction with this device should take to complete.
    SetInteractionTime<public>(Time:float):void = external {}

    # Returns the time (in seconds) that an interaction with this device will take to complete.
    GetInteractionTime<public>()<transacts>:float = external {}

    # Sets the quantity of a specific key item type that needs to be collected in order to activate the switch.
    # `KeyItemIndex` ranges from `0` to number of key item types - 1.
    SetItemCountRequired<public>(KeyItemIndex:int, Count:int):void = external {}

    # Returns the total quantity of a specific key item type that needs to be collected in order to activate the switch.
    GetItemCountRequired<public>(KeyItemIndex:int)<transacts>:int = external {}

    # Returns the remaining quantity of a specific key item type that needs to be collected in order to activate the switch.
    GetRemainingItemCountRequired<public>(KeyItemIndex:int)<transacts>:int = external {}

    # Sets the score to be awarded for a key item. `KeyItemIndex` ranges from `0` to number of key item types - 1.
    SetItemScore<public>(KeyItemIndex:int, Score:int):void = external {}

    # Returns the score to be awarded for a key item.
    GetItemScore<public>(KeyItemIndex:int)<transacts>:int = external {}

    # Returns how many items an `Agent` has of the item stored at `KeyItemIndex`.
    GetItemCount<public>(Agent:agent, KeyItemIndex:int):int = external {}

    # Returns if the `Agent` has all of the items required to interact with this Device.
    HasAllItems<public>(Agent:agent)<transacts><decides>:void = external {}

    # Returns if the `Agent` is currently holding any of the items stored in the Device.
    IsHoldingItem<public>(Agent:agent)<transacts><decides>:void = external {}

    # Returns if the `Agent` is currently holding the item stored at `KeyItemIndex`.
    IsHoldingItem<public>(Agent:agent, KeyItemIndex:int)<transacts><decides>:void = external {}

# Used to create a tile that changes colors when `agent`s interact with it.
color_changing_tiles_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when this device changes color.
    # Sends the `agent` that interacted with this device.
    ActivatedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Shows this device in the world.
    Show<public>():void = external {}

    # Hides this device from the world.
    Hide<public>():void = external {}

    # Resets this device to its initial settings.
    Reset<public>():void = external {}

    # Sets the color of the tile to `Agent`'s team color.
    SetTeam<public>(Agent:agent):void = external {}

# Used to place a collectible item into the world.
collectible_object_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the collectible item is collected.
    # Sends the `agent` that collected the item.
    CollectedEvent<public>:listenable(agent) = external {}

    # Makes the collectible visible.
    Show<public>():void = external {}

    # Makes the collectible invisible.
    Hide<public>():void = external {}

    # Immediately respawns the object for the instigating agent.
    # This will be affected by the option *Consume If Collected By*.
    Respawn<public>(Agent:agent):void = external {}

    # Immediately respawns the object for all agents.
    RespawnForAll<public>():void = external {}

# Used together with `class_selector_device` to create class based gameplay. Defines custom class attributes and inventory loadouts.
class_designer_device<public> := class<concrete><final>(creative_device_base):


# Used together with `class_designer_device` to control how/when created classes can be accessed by `agent`s.
class_and_team_selector_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` changes class.
    # Sends the `agent` whose class changed.
    ClassSwitchedEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` changes teams.
    # Sends the `agent` whose team changed.
    TeamSwitchedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Changes the `Agent`'s class.
    ChangeClass<public>(Agent:agent):void = external {}

    # Changes the `Agent`'s team.
    ChangeTeam<public>(Agent:agent):void = external {}

    # Changes the `Agent`'s team and class.
    ChangeTeamAndClass<public>(Agent:agent):void = external {}

    # Changes the selecting team.
    ChangeSelectorTeam<public>(Agent:agent):void = external {}

# Spawns and tracks a single item as a game objective (e.g. flag).
capture_item_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when spawned item is captured.
    # Sends the `agent` that captured the item.
    ItemCapturedEvent<public>:listenable(agent) = external {}

    # Signaled when spawned item is picked up.
    # Sends the `agent` that picked up the item.
    ItemPickedUpEvent<public>:listenable(agent) = external {}

    # Signaled when spawned item is dropped.
    # Sends the `agent` that dropped the item.
    ItemDroppedEvent<public>:listenable(agent) = external {}

    # Signaled when spawned item is returned.
    # Sends the `agent` that returned the item.
    ItemReturnedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

# Used to create a zone that can trigger effects once players enter it. Can be set up to be capturable by a team, to provide a score while held, or to require a specific item as a drop-off.
capture_area_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` enters this device area.
    # Sends the `agent` that entered this device area.
    AgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits this device area.
    # Sends the `agent` that exited this device area.
    AgentExitsEvent<public>:listenable(agent) = external {}

    # Signaled when the first `agent` enters this device area.
    # Sends the `agent` that entered this device area.
    FirstAgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when the last `agent` exits this device area.
    # Sends the `agent` that exited this device area.
    LastAgentExitsEvent<public>:listenable(agent) = external {}

    # Signaled when this device is contested.
    # Sends the `agent` that is contesting this device.
    AreaIsContestedEvent<public>:listenable(agent) = external {}

    # Signaled when this device is scored.
    # Sends the `agent` that scored this device.
    AreaIsScoredEvent<public>:listenable(agent) = external {}

    # Signaled when this device control change starts.
    # Sends the `agent` that is triggering this device control change.
    ControlChangeStartsEvent<public>:listenable(agent) = external {}

    # Signaled when this device control changes.
    # Sends the `agent` that triggered this device control change.
    ControlChangeEvent<public>:listenable(agent) = external {}

    # Signaled when an item is consumed by this device.
    # Sends the `agent` that provided the item to this device.
    ItemIsConsumedEvent<public>:listenable(agent) = external {}

    # Signaled when an item is delivered to this device.
    # Sends the `agent` that delivered the item to this device.
    ItemIsDeliveredEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Toggles between `Enable` and `Disable`.
    ToggleEnabled<public>():void = external {}

    # Allows this device to be captured.
    AllowCapture<public>():void = external {}

    # Disallows this device from being captured.
    DisallowCapture<public>():void = external {}

    # Toggles between `AllowCapture` and `DisallowCapture`.
    ToggleCaptureAllowed<public>():void = external {}

    # Resets control of this device for all teams.
    Reset<public>():void = external {}

    # Gives control of this device to the capturing `agent`'s team.
    GiveControl<public>(Agent:agent):void = external {}

    # Clears control of this device for all teams.
    Neutralize<public>():void = external {}

    # Activates the objective pulse for this device.
    ActivateObjectivePulse<public>():void = external {}

    # Deactivates the objective pulse for this device.
    DeactivateObjectivePulse<public>():void = external {}

    # Sets the *Capture Height* (in meters) of the capture area.
    SetHeight<public>(Height:float):void = external {}

    # Returns the *Capture Height* (in meters) of the capture area.
    GetHeight<public>()<varies>:float = external {}

    # Sets the *Capture Radius* (in meters) of the capture area.
    SetRadius<public>(Radius:float):void = external {}

    # Returns the *Capture Radius* (in meters) of the capture area.
    GetRadius<public>()<varies>:float = external {}

# Used to create a button which can trigger other devices when an agent interacts with it.
button_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` successfully interacts with the button for `GetInteractionTime` seconds.
    # Sends the `agent` that interacted with the button.
    InteractedWithEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Sets the text that displays when an `agent` is close to this button and looks at it. `Text` is limited to `64` characters.
    SetInteractionText<public>(Text:message):void = external {}

    # Sets the duration of the interaction required to activate this device (in seconds).
    SetInteractionTime<public>(Time:float):void = external {}

    # Returns the duration of the interaction required to activate this device (in seconds).
    GetInteractionTime<public>()<transacts>:float = external {}

    # Sets the maximum amount of times this button can be interacted with before it will be disabled.
    #  * `MaxCount` must be between `0` and `10`.
    #  * `0` indicates no limit on trigger count.
    SetMaxTriggerCount<public>(MaxCount:int):void = external {}

    # Returns the maximum amount of times this button can be interacted with before it will be disabled.
    #  * `GetTriggerMaxCount` will be between `0` and `10`.
    #  * `0` indicates no limit on trigger count.
    GetMaxTriggerCount<public>()<transacts>:int = external {}

    # Returns the number of times that this button can still be interacted with before it will be disabled. Will return `0` if `GetMaxTriggerCount` is unlimited.
    GetTriggerCountRemaining<public>()<transacts>:int = external {}

# Used to display custom text messages on a billboard.
billboard_device<public> := class<concrete><final>(creative_device_base):
    # Shows the billboard text.
    ShowText<public>():void = external {}

    # Hides the billboard text.
    HideText<public>():void = external {}

    # Updates the device display to show the current *Text*.
    UpdateDisplay<public>():void = external {}

    # Sets the visibility of the device border mesh. This also determines whether the device collision is enabled.
    SetShowBorder<public>(Show:logic):void = external {}

    # Returns `true` if the device border is enabled.
    GetShowBorder<public>()<transacts>:logic = external {}

    # Sets the device *Text*.
    SetText<public>(Text:message):void = external {}

    # Sets the *Text Size* of the device *Text*. Clamped to range [8, 24].
    SetTextSize<public>(Size:int):void = external {}

    # Returns the *Text Size* of the device *Text*.
    GetTextSize<public>()<transacts>:int = external {}

# Used to show an in world visual effect and/or a HUD marker at the desired location.
beacon_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Adds the specified `agent` to a list of `agent`s that the Beacon will be shown to. This list of `agent`s is maintained separately from the Team Visibility set of `agent`s.
    AddToShowList<public>(Agent:agent):void = external {}

    # Removes the specified `agent` from the show list. The `agent` will still see the Beacon if they meet the Team Visibility check.
    RemoveFromShowList<public>(Agent:agent):void = external {}

    # Removes all `agent`s from the show list. `Agent`s will still see the Beacon if they meet the Team Visibility check.
    RemoveAllFromShowList<public>():void = external {}

# A simplified storm device that provides a way to create a single-phase storm and control its basic behaviors.
# To control multiple phases of the storm see `advanced_storm_controller_device`.
basic_storm_controller_device<public> := class<concrete><final>(storm_controller_device):


# Base class for devices that spawn items.
base_item_spawner_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Signaled when an `agent` picks up the spawned item.
    # Sends the `agent` that picked up the item.
    ItemPickedUpEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

# Used to spawn various types of balls. Can be used to control HUD elements related to the spawned balls.
ball_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Shows the floating HUD Icons to players, if these have been configured by the device.
    ShowHUD<public>():void = external {}

    # Hides the floating HUD Icons from players, if these have been configured by the device.
    HideHUD<public>():void = external {}

# Evaluates attributes for `agent` when signaled from other devices. Acts as branching logic, checking whether the `agent` associated with the signal passes all of the tests setup in this device, then sends a signal on either `PassEvent` or `FailEvent`.
attribute_evaluator_device<public> := class<concrete><final>(trigger_base_device):
    # Signaled when the `agent` from `EvaluateAgent` passes the requirements specified by this device.
    # Sends the `agent` originally passed to this device in `EvaluateAgent`.
    PassEvent<public>:listenable(agent) = external {}

    # Signaled when the `agent` from `EvaluateAgent` fails the requirements specified by this device.
    # Sends the `agent` originally passed to this device in `EvaluateAgent`.
    FailEvent<public>:listenable(agent) = external {}

    # Tests whether the specified agent satisfies the required conditions specified on the device (e.g. eliminations/score), and fires either the `PassEvent` or `FailEvent` accordingly.
    EvaluateAgent<public>(Agent:agent):void = external {}

# Used to boost `agent`s, vehicles, and other objects upwards into the air.
air_vent_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Activates this device.
    Activate<public>():void = external {}

# Used to control a Battle Royale-style storm with up to 50 phases.
# 
# Like `basic_storm_controller_device`s, you can use this storm to keep players inside a playable area, but unlike the `basic_storm_controller_device`, this device generates multiple storm phases. When used in conjunction with `advanced_storm_beacon_device`s, you can customize each phase of the storm by applying one or more beacons and setting customization options for the specific phase you assign to that beacon.
advanced_storm_controller_device<public> := class<concrete><final>(storm_controller_device):


# Used in conjunction with `advanced_storm_controller_device` to customize individual storm phases.
advanced_storm_beacon_device<public> := class<concrete><final>(creative_device_base):
    # Teleports the `advanced_storm_beacon_device` to the specified `Position` and `Rotation`. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    # Teleports the `advanced_storm_beacon_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Transform:transform)<transacts><decides>:void = external {}

    # Moves the `advanced_storm_beacon_device` to the specified `Position` and `Rotation` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `advanced_storm_beacon_device` to the specified `Transform` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Transform:transform, OverTime:float)<suspends>:move_to_result = external {}