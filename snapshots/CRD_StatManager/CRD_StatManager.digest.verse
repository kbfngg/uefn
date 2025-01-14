using {/Verse.org/Simulation}
# A device that generates a scoreboard stat that can be used by the game to determine Game End and Round End conditions.
# The stat can apply to individual players, teams, or everyone in the match. It can also generate a Level that will increment by 1 each time Value reaches *Max Value*, resetting Value to 0 when Level increments.
stat_creator_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when the stat changes Value.
    # Sends a tuple of the instigating `agent` (or `false` if none) and the new Value. Value increases to a maximum of *Max Value*. If the stat has not yet reached *Max Level* then Value will reset to 0 and Level will increment by 1.
    ValueChangedEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Signaled when the stat changes Level.
    # Sends a tuple of the instigating `agent` (or `false` if none) and the new Level.
    LevelChangedEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Signaled when an `agent` reaches the maximum stat value. This occurs when the stat reaches *Max Value* if the device has no levels, or *Max Level* if that option is set.
    # Sends the `agent` that caused the stat event that changed the level and the new level as an `int` .
    MaximumReachedEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Returns stat Value for `Agent`.
    # Succeeds if *Scope* is set to *Player* and `Agent` passes the requirement checks on the device.
    GetValue<public>(Agent:agent)<transacts><decides>:int = external {}

    # Returns stat Value for `Team`.
    # Succeeds if *Scope* is set to *Team* and `Team` passes the requirement checks on the device.
    GetValue<public>(Team:team)<transacts><decides>:int = external {}

    # Returns stat Value for the match.
    # Succeeds if *Scope* is set to *Match*.
    GetValueForMatch<public>()<transacts><decides>:int = external {}

    # Updates stat Value for `Agent`.
    # Succeeds if *Scope* is set to *Agent* and `Agent` passes the requirement checks on the device.
    # If the stat does not have levels, `Value` is clamped between 0 and *Max Value*.
    # If the stat does have levels, the Value is not clamped and setting a value below 0 or above *Max Value* will
    # decrement or increment the level appropriately. e.g. if *Number of Levels* is 10, *Max Value is 100* 
    # and you are currently level 0, a `Value` of 550 will set you to Level 5 and Value 50.
    SetValue<public>(Agent:agent, Value:int)<transacts><decides>:void = external {}

    # Updates stat Value for `Team`.
    # Succeeds if *Scope* is set to *Team* and `Team` passes the requirement checks on the device.
    # If the stat does not have levels, `Value` is clamped between 0 and *Max Value*.
    # If the stat does have levels, the Value is not clamped and setting a value below 0 or above *Max Value* will
    # decrement or increment the level appropriately. e.g. if *Number of Levels* is 10, *Max Value is 100* 
    # and you are currently level 0, a `Value` of 550 will set you to Level 5 and Value 50.
    SetValue<public>(Team:team, Value:int)<transacts><decides>:void = external {}

    # Updates stat Value for the match.
    # Succeeds if *Scope* is set to *Match*.
    # If the stat does not have levels, `Value` is clamped between 0 and *Max Value*.
    # If the stat does have levels, the Value is not clamped and setting a value below 0 or above *Max Value* will
    # decrement or increment the level appropriately. e.g. if *Number of Levels* is 10, *Max Value is 100* 
    # and you are currently level 0, a `Value` of 550 will set you to Level 5 and Value 50.
    SetValueForMatch<public>(Value:int)<transacts><decides>:void = external {}

    # Returns stat Level for `Agent`.
    # Succeeds if *Number of Levels* is set to greater than 0, *Scope* is set to *Player* 
    # and `Agent` passes the requirement checks on the device.
    GetLevel<public>(Agent:agent)<transacts><decides>:int = external {}

    # Returns stat Level for `Team`.
    # Succeeds if *Number of Levels* is set to greater than 0, *Scope* is set to *Team* 
    # and the `Team` passes the requirement checks on the device.
    GetLevel<public>(Team:team)<transacts><decides>:int = external {}

    # Returns stat Level for the match.
    # Succeeds if *Number of Levels* is set to greater than 0 and *Scope* is set to *Match*.
    GetLevelForMatch<public>()<transacts><decides>:int = external {}

    # Updates stat Level for `Agent`.
    # Succeeds if *Number of Levels* is set to greater than 0 and *Scope* is set to *Agent*.
    # Altering stat Level will set `Agent`'s stat Value to 0.
    SetLevel<public>(Agent:agent, Level:int)<transacts><decides>:void = external {}

    # Updates stat Level for `Team`.
    # Succeeds if *Number of Levels* is set to greater than 0 and *Scope* is set to *Team*.
    # Altering stat Level will set `Team`'s stat Value to 0.
    SetLevel<public>(Team:team, Level:int)<transacts><decides>:void = external {}

    # Updates stat Level for the match.
    # Succeeds if *Number of Levels* is set to greater than 0 and *Scope* is set to *Match* .
    # Altering stat Level will set the Match's stat Value to 0.
    SetLevelForMatch<public>(Level:int)<transacts><decides>:void = external {}

    # Returns the name for the stat that is generated by this Stat Creator.
    GetName<public>():string = external {}

# Used to increase or decrease a stat for an `agent`.
stat_powerup_device<public> := class<concrete><final>(powerup_device):
    # Sets the *Magnitude* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    # For the Stat Powerup, this is the value of the stat that the powerup will add or remove to a player that picks up the powerup.
    SetMagnitude<public>(Magnitude:float):void = external {}

    # Returns the current *Magnitude* for the powerup.
    # For the Stat Powerup, this is the value of the stat that the powerup will add or remove to a player that picks up the powerup.
    GetMagnitude<public>()<transacts>:float = external {}