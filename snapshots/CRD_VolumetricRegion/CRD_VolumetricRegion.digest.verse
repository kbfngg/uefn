using {/Verse.org/Simulation}
# Used to create a zone where players are put into a skydive state. Can customize the amount of force used to push the player, and how fast players are launched into the air. The direction of the push is in relation to the device, so you can rotate and overlap several devices, then use variable speeds to create pneumatic tubes that propel players in different directions. You can even create unique traversal (traveling) options, where players can use these zones to reach places on your island they couldn't reach any other way.
skydive_volume_device<public> := class<concrete><final>(effect_volume_device):
    # Signaled when an `agent` enters the volume.
    # Sends the `agent` that entered the volume.
    AgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the volume.
    # Sends the `agent` that exited the volume.
    AgentExitsEvent<public>:listenable(agent) = external {}

    # Signaled when the zone changes from empty to occupied.
    # Sends the `agent` that entered the volume.
    ZoneOccupiedEvent<public>:listenable(agent) = external {}

    # Signaled when the zone changes from occupied to empty.
    # Sends the `agent` that last left the volume.
    ZoneEmptiedEvent<public>:listenable(agent) = external {}

    # Enables volume locking which prevents users from leaving the volume once they've entered.
    EnableVolumeLocking<public>():void = external {}

    # Disables volume locking which prevents users from leaving the volume once they've entered.
    DisableVolumeLocking<public>():void = external {}

    # Is true when `Agent` is in the volume.
    IsInVolume<public>(Agent:agent)<transacts><decides>:void = external {}

# Used to specify a zone where custom gameplay effects can be applied (e.g. gravity, no build, no weapons).
mutator_zone_device<public> := class<concrete><final>(effect_volume_device):
    # Signaled when an `agent` in this zone begins emoting. This will not signal if the `agent` is on the *Safe Team* or if *Affects Players* is disabled.
    # Sends the `agent` that started emoting.
    AgentBeginsEmotingEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` in this zone ends emoting. This will not signal if the `agent` is on the *Safe Team* or if *Affects Players* is disabled.
    # Sends the `agent` that stopped emoting.
    AgentEndsEmotingEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` enters this zone.
    # Sends the `agent` entering this zone.
    AgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits this zone.
    # Sends the `agent` exiting this zone.
    AgentExitsEvent<public>:listenable(agent) = external {}

    # Updates *Selected Class* to `Agent`'s class.
    UpdateSelectedClass<public>(Agent:agent):void = external {}

    # Updates *Selected Team* to `Agent`'s team.
    UpdateSelectedTeam<public>(Agent:agent):void = external {}

    # Is true when `Agent` is in the zone.
    IsInVolume<public>(Agent:agent)<transacts><decides>:void = external {}

# Used to specify an area which allows (or prevents) various objects, terrain, or buildings from being set on fire.
fire_volume_device<public> := class<concrete><final>(effect_volume_device):
    # Extinguishes objects inside this device area.
    Extinguish<public>():void = external {}

    # Ignites objects inside this device area.
    Ignite<public>():void = external {}

# Base class for types of volumes with special gameplay properties.
effect_volume_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

# Used to specify an area volume which can damage `agent`s, vehicles, and creatures.
damage_volume_device<public> := class<concrete><final>(effect_volume_device):
    # Signaled when an `agent` enters the volume.
    # Sends the `agent` entering the volume.
    AgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the volume.
    # Sends the `agent` exiting the volume.
    AgentExitsEvent<public>:listenable(agent) = external {}

    # Updates *Selected Class* to `Agent`'s class.
    UpdateSelectedClass<public>(Agent:agent):void = external {}

    # Updates *Selected Team* to `Agent`'s team.
    UpdateSelectedTeam<public>(Agent:agent):void = external {}

    # Sets the damage to be applied each tick within the volume. `Damage` is clamped between `1` and `500`.
    SetDamage<public>(Damage:int):void = external {}

    # Returns the damage to be applied each tick within the volume.
    GetDamage<public>()<transacts>:int = external {}

    # Is true when `Agent` is in the zone.
    IsInVolume<public>(Agent:agent)<transacts><decides>:void = external {}

# Creates an impenetrable zone that can block `agent` movement and weapon fire.
barrier_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Adds the specified `agent` to a list of additional `agent`s that the Barrier should ignore. This list is in addition to the Ignore Team and Ignore Class options. Note: Has no effect on bullets.
    AddToIgnoreList<public>(Agent:agent):void = external {}

    # Removes the specified `agent` from the ignore list. The `agent` will still be ignored if they are on an ignored team or of an ignored class.
    RemoveFromIgnoreList<public>(Agent:agent):void = external {}

    # Removes all `agent`s from the ignore list. `Agent`s will still be ignored if they are on an ignored team or of an ignored class.
    RemoveAllFromIgnoreList<public>():void = external {}